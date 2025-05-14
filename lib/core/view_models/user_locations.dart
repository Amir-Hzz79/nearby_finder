import '../models/location.dart';
import '../models/place.dart';

class UserLocations {
  Future<Location>? currentLocation;
  Future<List<Place>>? nearbyPlaces;

  UserLocations({this.currentLocation, this.nearbyPlaces});
}
