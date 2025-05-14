import 'package:geolocator/geolocator.dart';

class Location {
  final double latitude;
  final double longitude;

  Location({required this.latitude, required this.longitude});

  factory Location.fromPosition(Position position) {
    return Location(latitude: position.latitude, longitude: position.longitude);
  }
  
  @override
  String toString() {
    return 'Location(latitude: $latitude, longitude: $longitude)';
  }
}
