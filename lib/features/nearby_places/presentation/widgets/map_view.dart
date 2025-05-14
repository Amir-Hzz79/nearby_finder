import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';

import 'package:latlong2/latlong.dart';

class MapView extends StatelessWidget {
  final LatLng initialLocation;
  final List<LatLng> locations;

  const MapView({
    super.key,
    required this.initialLocation,
    this.locations = const [],
  });

  @override
  Widget build(BuildContext context) {
    return FlutterMap(
      options: MapOptions(
        interactionOptions: const InteractionOptions(),
        initialCenter: initialLocation,
      ),
      children: [
        TileLayer(
          urlTemplate: 'https://tile.openstreetmap.org/{z}/{x}/{y}.png',
          userAgentPackageName: 'ir.amirhosseinzamani.nearby_finder',
        ),
        MarkerLayer(
          markers: [
            Marker(
              width: 40.0,
              height: 40.0,
              point: LatLng(
                initialLocation.latitude,
                initialLocation.longitude,
              ),
              child: const Icon(
                Icons.location_pin,
                color: Colors.red,
                size: 40,
              ),
            ),
            ...locations.map(
              (e) => Marker(
                width: 40.0,
                height: 40.0,
                point: LatLng(e.latitude, e.longitude),
                child: const Icon(
                  Icons.location_pin,
                  color: Colors.blue,
                  size: 40,
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }
}
