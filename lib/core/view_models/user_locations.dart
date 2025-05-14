import '../models/location.dart';
import '../models/place_model.dart';

class UserLocations {
  Future<Location>? currentLocation;
  Future<List<PlaceModel>>? nearbyPlaces;

  UserLocations({this.currentLocation, this.nearbyPlaces});
}
