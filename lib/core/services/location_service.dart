import 'package:dio/dio.dart';
import 'package:geolocator/geolocator.dart';
import 'package:nearby_finder/core/models/location.dart';

import '../models/place.dart';

class LocationService {
  final Dio _dio;
  final String _baseUrl = 'https://api.foursquare.com/v3/places/search';
  final String _apiKey = 'fsq3tRB2+I/ih9iDaD1uDMNv4a9rDTqZGO1Id1+4tu/ewMk=';

  LocationService(this._dio);

  Future<Location?> getCurrentLocation() async {
    bool serviceEnabled;
    LocationPermission permission;

    // Check if location services are enabled
    serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      return Future.error('Location services are disabled.');
    }

    // Check location permission
    permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        return Future.error('Location permissions are denied');
      }
    }

    if (permission == LocationPermission.deniedForever) {
      return Future.error('Location permissions are permanently denied.');
    }

    // Get current position
    final Position currentLocation = await Geolocator.getCurrentPosition(
      desiredAccuracy: LocationAccuracy.high,
    );

    return Location.fromPosition(currentLocation);
  }

  Future<List<Place>> getNearbyPlaces({
    required Location currentLocation,
    int radius = 1000,
  }) async {
    try {
      final response = await _dio.get(
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
        throw Exception('No results found');
      }

      final List<dynamic> results = data['results'];

      return results.map((item) => Place.fromJson(item)).toList();
    } catch (e) {
      return [];
    }
  }
}
