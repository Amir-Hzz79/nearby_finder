import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:dio/dio.dart';
import 'package:geolocator/geolocator.dart';
import 'package:nearby_finder/core/data/database/places_dao.dart';
import 'package:nearby_finder/core/models/location.dart';
import 'package:nearby_finder/core/utils/extentions/conectivity_extentions.dart';

import '../models/location_exception.dart';
import '../models/place_model.dart';
import 'location_prefrence_service.dart';

class LocationService {
  final Dio dio;
  final LocationPrefrenceService locationPrefrenceService;
  final PlacesDao placesDao;
  final String _baseUrl = 'https://api.foursquare.com/v3/places/search';
  final String _apiKey = 'fsq3tRB2+I/ih9iDaD1uDMNv4a9rDTqZGO1Id1+4tu/ewMk=';

  LocationService({
    required this.dio,
    required this.locationPrefrenceService,
    required this.placesDao,
  });

  Future<bool> _hasInternetConnection() async {
    final List<ConnectivityResult> result =
        await Connectivity().checkConnectivity();

    return result.hasInternetConnection();
  }

  Future<Location> getCurrentLocation() async {
    bool connected = await _hasInternetConnection();

    if (connected) {
      bool serviceEnabled;
      LocationPermission permission;

      // Check if location services are enabled
      serviceEnabled = await Geolocator.isLocationServiceEnabled();
      if (!serviceEnabled) {
        throw const LocationException('Location services are disabled.');
      }

      // Check location permission
      permission = await Geolocator.checkPermission();
      if (permission == LocationPermission.denied) {
        permission = await Geolocator.requestPermission();
        if (permission == LocationPermission.denied) {
          throw const LocationException('Location permission was denied.');
        }
      }

      if (permission == LocationPermission.deniedForever) {
        throw const LocationException(
          'Location permission is permanently denied. Please enable it from settings.',
        );
      }

      // Get current position
      final Location currentLocation = Location.fromPosition(
        await Geolocator.getCurrentPosition(
          desiredAccuracy: LocationAccuracy.high,
        ),
      );

      // Save to shared preferences
      await locationPrefrenceService.saveLocation(currentLocation);

      return currentLocation;
    } else {
      final Location? lastLocation =
          await locationPrefrenceService.getSavedLocation();

      if (lastLocation == null) {
        // No internet & no cached location → user must be online at least once
        throw const LocationException(
          'No internet connection and no cached location found. Please connect to the internet for the first time.',
        );
      }

      return lastLocation;
    }
  }

  Future<List<PlaceModel>> getNearbyPlaces({
    required Location currentLocation,
    int radius = 1000,
  }) async {
    bool connected = await _hasInternetConnection();

    if (connected) {
      final response = await dio.get(
        _baseUrl,
        queryParameters: {
          'll': '${currentLocation.latitude},${currentLocation.longitude}',
          'radius': radius,
        },
        options: Options(
          headers: {'Authorization': _apiKey, 'accept': 'application/json'},
        ),
      );

      final data = response.data;

      if (data == null || data['results'] == null) {
        throw LocationException('No results found');
      }

      final List<dynamic> results = data['results'];

      final List<PlaceModel> places =
          results.map((item) => PlaceModel.fromJson(item)).toList();

      //Insert places to local database
      placesDao.insertPlaces(places);

      return places;
    } else {
      final List<PlaceModel> storedPlaces = await placesDao.getAllNearbyPlaces(
        currentLocation,
        radius,
      );

      return storedPlaces;
    }
  }
}
