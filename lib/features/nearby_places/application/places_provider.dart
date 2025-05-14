import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:nearby_finder/core/view_models/user_locations.dart';

import '../../../core/get_it.dart';

import '../../../core/services/location_service.dart';

final placesProvider = StateNotifierProvider<PlacesNotifier, UserLocations>(
  (ref) => PlacesNotifier(),
);

class PlacesNotifier extends StateNotifier<UserLocations> {
  PlacesNotifier() : super(UserLocations(nearbyPlaces: Future.value([]))) {
    final LocationService locationService = getIt<LocationService>();

    final UserLocations userLocations = UserLocations();

    userLocations.currentLocation = locationService.getCurrentLocation().then((
      currentLocation,
    ) {
      userLocations.nearbyPlaces = locationService.getNearbyPlaces(
        currentLocation: currentLocation!,
      );

      setPlaces(userLocations);

      return currentLocation;
    });
  }

  void setPlaces(UserLocations newPlaces) {
    state = newPlaces;
  }

  void clearPlaces() {
    state = UserLocations(nearbyPlaces: Future.value([]));
  }
}
