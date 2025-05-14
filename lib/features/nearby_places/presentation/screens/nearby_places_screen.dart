import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:nearby_finder/core/get_it.dart';
import 'package:nearby_finder/core/models/location.dart';
import 'package:nearby_finder/core/view_models/user_locations.dart';
import 'package:nearby_finder/features/nearby_places/presentation/widgets/place_tile.dart';
import 'package:skeletonizer/skeletonizer.dart';

import '../../../../core/theme/theme_provider.dart';
import '../../../../core/models/place_model.dart';
import '../../../../core/services/location_service.dart';
import '../../application/places_provider.dart';
import '../widgets/map_view.dart';

class NearbyPlacesScreen extends ConsumerStatefulWidget {
  const NearbyPlacesScreen({super.key});

  @override
  ConsumerState<NearbyPlacesScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends ConsumerState<NearbyPlacesScreen> {
  final LocationService locationService = getIt<LocationService>();
  List<PlaceModel> nearbyPlaces = [];
  double selectedRadius = 500;
  final MapController _mapController = MapController();

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    _mapController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final UserLocations userLocations = ref.watch(placesProvider);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Home Page'),
        actions: [
          IconButton(
            icon: Icon(
              ref.watch(themeModeProvider) == ThemeMode.dark
                  ? Icons.dark_mode
                  : Icons.light_mode,
            ),
            onPressed: () => ref.read(themeModeProvider.notifier).toggleTheme(),
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            FutureBuilder(
              future: userLocations.currentLocation,
              builder: (context, currentLocationSnapshot) {
                final currentLocation =
                    currentLocationSnapshot.data ??
                    Location(latitude: 0, longitude: 0);

                return FutureBuilder(
                  future: userLocations.nearbyPlaces,
                  builder: (context, nearbyPlacesSnapshot) {
                    nearbyPlaces = nearbyPlacesSnapshot.data ?? [];

                    return Skeletonizer(
                      enabled:
                          currentLocationSnapshot.connectionState ==
                              ConnectionState.waiting ||
                          !currentLocationSnapshot.hasData ||
                          currentLocationSnapshot.data == null ||
                          nearbyPlacesSnapshot.connectionState ==
                              ConnectionState.waiting ||
                          !nearbyPlacesSnapshot.hasData ||
                          nearbyPlacesSnapshot.data == null,
                      child: SizedBox(
                        width: double.infinity,
                        height: MediaQuery.of(context).size.height * 0.5,
                        child: MapView(
                          controller: _mapController,
                          radius: selectedRadius,
                          currentLocation: currentLocation,
                          places: nearbyPlaces,
                        ),
                      ),
                    );
                  },
                );
              },
            ),
            const SizedBox(height: 32),
            FutureBuilder(
              future: userLocations.currentLocation,
              builder: (context, snapshot) {
                final currentLocation =
                    snapshot.data ?? Location(latitude: 0, longitude: 0);

                return Skeletonizer(
                  enabled:
                      snapshot.connectionState == ConnectionState.waiting ||
                      !snapshot.hasData ||
                      snapshot.data == null,
                  child: Slider(
                    value: selectedRadius,
                    min: 100,
                    max: 2000,
                    divisions: 20,
                    label: '${selectedRadius}m',
                    onChanged: (value) {
                      setState(() {
                        selectedRadius = value;
                      });
                    },
                    onChangeEnd: (value) {
                      setState(() {
                        ref
                            .read(placesProvider.notifier)
                            .fetchNearbyPlaces(
                              currentLocation,
                              selectedRadius.toInt(),
                            );
                      });
                    },
                  ),
                );
              },
            ),
            FutureBuilder(
              future: userLocations.currentLocation,
              builder: (context, snapshot) {
                final currentLocation =
                    snapshot.data /* ?? Location(latitude: 0, longitude: 0) */;

                return Skeletonizer(
                  enabled:
                      snapshot.connectionState == ConnectionState.waiting ||
                      !snapshot.hasData ||
                      snapshot.data == null,
                  child: ListTile(
                    leading: Icon(Icons.location_on),
                    title: Text(
                      'Nearby Places (${selectedRadius.toInt()}m)',
                      style: Theme.of(context).textTheme.titleMedium,
                    ),
                    trailing: FilledButton.tonal(
                      onPressed: () {
                        /* _mapController.move(currentLocation!.toLatLng(), 50); */
                      },
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        spacing: 5,
                        children: [
                          Icon(Icons.location_on),
                          Text(
                            'You',
                            style: Theme.of(context).textTheme.titleMedium,
                          ),
                        ],
                      ),
                    ),
                  ),
                );
              },
            ),

            const SizedBox(height: 8),
            FutureBuilder(
              future: userLocations.nearbyPlaces,
              builder: (context, snapshot) {
                nearbyPlaces =
                    snapshot.data ??
                    List.generate(
                      5,
                      (index) => PlaceModel(
                        id: '$index',
                        name: 'place holder',
                        distance: 100,
                        categoryName: 'place holder',
                        categoryIconUrl: 'place holder',
                        address: 'place holder',
                        location: Location(
                          latitude: index.toDouble(),
                          longitude: index.toDouble(),
                        ),
                        status: 'place holder',
                      ),
                    );

                return Skeletonizer(
                  enabled: /* true, */
                      snapshot.connectionState == ConnectionState.waiting ||
                      !snapshot.hasData ||
                      snapshot.data == null,
                  child: ListView.builder(
                    shrinkWrap: true,
                    itemCount: nearbyPlaces.length,
                    physics: NeverScrollableScrollPhysics(),
                    itemBuilder:
                        (context, index) => PlaceTile(
                          /*  onTap: () {
                            _mapController.move(
                              nearbyPlaces[index].location.toLatLng(),
                              50,
                            );
                          }, */
                          place: nearbyPlaces[index],
                        ),
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
