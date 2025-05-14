import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:nearby_finder/core/data/database/places_dao.dart';
import 'package:nearby_finder/core/view_models/user_locations.dart';

import '../../../core/get_it.dart';

import '../../../core/models/location.dart';
import '../../../core/models/place_model.dart';
import '../../../core/services/location_service.dart';

final placesProvider = StateNotifierProvider<PlacesNotifier, UserLocations>(
  (ref) => PlacesNotifier(),
);

class PlacesNotifier extends StateNotifier<UserLocations> {
  PlacesNotifier() : super(UserLocations(nearbyPlaces: Future.value([]))) {
    fetchLocations(500);
  }

  Future<UserLocations> fetchLocations(int nearbyRadius) {
    final LocationService locationService = getIt<LocationService>();
    final PlacesDao placesDao = getIt<PlacesDao>();
    final UserLocations userLocations = UserLocations();

    userLocations.currentLocation = locationService.getCurrentLocation().then((
      currentLocation,
    ) {
      userLocations.nearbyPlaces = locationService
          .getNearbyPlaces(
            currentLocation: currentLocation!,
            radius: nearbyRadius,
          )
          .then((places) {
            placesDao.insertPlaces(places);

            return places;
          });

      setPlaces(userLocations);

      return currentLocation;
    });

    return Future.value(userLocations);
  }

  Future<List<PlaceModel>> fetchNearbyPlaces(
    Location currentLocation,
    int nearbyRadius,
  ) {
    final LocationService locationService = getIt<LocationService>();
    final Future<List<PlaceModel>> nearbyPlaces = locationService
        .getNearbyPlaces(
          currentLocation: currentLocation,
          radius: nearbyRadius,
        );

    setPlaces(
      UserLocations(
        currentLocation: Future.value(currentLocation),
        nearbyPlaces: nearbyPlaces,
      ),
    );

    return nearbyPlaces;
  }

  void setPlaces(UserLocations newPlaces) {
    state = newPlaces;
  }

  void clearPlaces() {
    state = UserLocations(nearbyPlaces: Future.value([]));
  }
}
