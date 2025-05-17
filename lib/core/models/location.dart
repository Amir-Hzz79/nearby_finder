import 'dart:math';

import 'package:geolocator/geolocator.dart';
import 'package:latlong2/latlong.dart';

class Location {
  final double latitude;
  final double longitude;

  Location({required this.latitude, required this.longitude});

  factory Location.fromPosition(Position position) {
    return Location(latitude: position.latitude, longitude: position.longitude);
  }

  LatLng toLatLng() => LatLng(latitude, longitude);

  @override
  String toString() {
    return 'Location(latitude: $latitude, longitude: $longitude)';
  }

  double distance(Location other) {
    const earthRadius = 6371; // km
    final dLat = _toRadians(other.latitude - latitude);
    final dLon = _toRadians(other.longitude - longitude);

    final a =
        sin(dLat / 2) * sin(dLat / 2) +
        cos(_toRadians(latitude)) *
            cos(_toRadians(other.latitude)) *
            sin(dLon / 2) *
            sin(dLon / 2);

    final c = 2 * atan2(sqrt(a), sqrt(1 - a));
    return earthRadius * c;
  }

  double _toRadians(double degree) => degree * pi / 180;
}
