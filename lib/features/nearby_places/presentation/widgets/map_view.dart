import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';

import 'package:latlong2/latlong.dart';
import 'package:nearby_finder/core/models/location.dart';

import '../../../../core/models/place.dart';
import 'place_details.dart';

class MapView extends StatefulWidget {
  final MapController? controller;
  final Location? currentLocation;
  final List<Place> places;
  final double radius;

  const MapView({
    super.key,
    this.currentLocation,
    this.places = const [],
    this.controller,
    required this.radius,
  });

  @override
  State<MapView> createState() => _MapViewState();
}

class _MapViewState extends State<MapView> {
  late MapController mapController;

  @override
  void initState() {
    super.initState();
    mapController = widget.controller ?? MapController();

    // Ensure the map moves to new current location when it changes
    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (widget.currentLocation != null) {
        mapController.move(
          widget.currentLocation!.toLatLng(),
          mapController.camera.zoom,
        );
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    print(widget.currentLocation);
    return FlutterMap(
      mapController: mapController,
      options:
          widget.currentLocation == null
              ? MapOptions(interactionOptions: const InteractionOptions())
              : MapOptions(
                interactionOptions: const InteractionOptions(),
                initialCenter: widget.currentLocation!.toLatLng(),
              ),
      children: [
        TileLayer(
          urlTemplate: 'https://tile.openstreetmap.org/{z}/{x}/{y}.png',
          userAgentPackageName: 'ir.amirhosseinzamani.nearby_finder',
        ),
        if (widget.currentLocation != null)
          CircleLayer(
            circles: [
              CircleMarker(
                point: widget.currentLocation!.toLatLng(),
                color: Colors.blue.withOpacity(0.3),
                borderColor: Colors.blue,
                borderStrokeWidth: 2,
                useRadiusInMeter: true,
                radius: widget.radius,
              ),
            ],
          ),
        MarkerLayer(
          markers: [
            if (widget.currentLocation != null)
              Marker(
                rotate: true,
                width: 40.0,
                height: 40.0,
                point: LatLng(
                  widget.currentLocation!.latitude,
                  widget.currentLocation!.longitude,
                ),
                child: Icon(
                  Icons.location_pin,
                  color: Theme.of(context).colorScheme.secondary,
                  size: 40,
                ),
              ),
            ...widget.places.map(
              (place) => Marker(
                rotate: true,
                width: 32.0,
                height: 32.0,
                point: place.location.toLatLng(),
                child: InkWell(
                  onTap: () {
                    Navigator.of(context).push(
                      ModalBottomSheetRoute(
                        showDragHandle: true,
                        enableDrag: true,
                        builder:
                            (context) => IntrinsicHeight(
                              child: PlaceDetails(place: place),
                            ),
                        isScrollControlled: true,
                      ),
                    );
                  },
                  child: Container(
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: Colors.grey.withOpacity(0.4),
                    ),
                    child: Image.network(
                      place.categoryIconUrl,
                      errorBuilder:
                          (context, error, stackTrace) => const Icon(
                            Icons.location_pin,
                            color: Colors.black87,
                            size: 40,
                          ),

                      color: Colors.black87,
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }
}
