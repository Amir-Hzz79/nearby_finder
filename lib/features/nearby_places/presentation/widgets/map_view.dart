import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';

import 'package:latlong2/latlong.dart';

import '../../../../core/models/place.dart';

class MapView extends StatelessWidget {
  final MapController? controller;
  final LatLng initialLocation;
  final List<Place> places;

  const MapView({
    super.key,
    required this.initialLocation,
    this.places = const [],
    this.controller,
  });

  @override
  Widget build(BuildContext context) {
    return FlutterMap(
      mapController: controller,
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
              rotate: true,
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
            ...places.map(
              (place) => Marker(
                rotate: true,
                width: 40.0,
                height: 40.0,
                point: place.location.toLatLng(),
                child: Image.network(
                  place.categoryIconUrl,
                  errorBuilder:
                      (context, error, stackTrace) => const Icon(
                        Icons.location_pin,
                        color: Colors.black87,
                        size: 40,
                      ),

                  /* loadingBuilder:
                      (context, error, stackTrace) => const Icon(
                        Icons.location_pin,
                        color: Colors.black87,
                        size: 40,
                      ), */
                  color: Colors.black87,
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }
}
