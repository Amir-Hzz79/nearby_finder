import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:latlong2/latlong.dart';
import 'package:nearby_finder/core/get_it.dart';
import 'package:nearby_finder/core/view_models/user_locations.dart';
import 'package:nearby_finder/features/nearby_places/presentation/widgets/place_tile.dart';

import '../../../../core/theme/theme_provider.dart';
import '../../../../core/models/place.dart';
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
  Future<List<Place>>? nearbyPlaces;

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
      body: FutureBuilder(
        future: userLocations.currentLocation,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting ||
              !snapshot.hasData ||
              snapshot.data == null) {
            return const Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return const Center(child: Text('Error fetching location'));
          }

          final currentLocation = snapshot.data!;

          return FutureBuilder(
            future: userLocations.nearbyPlaces,
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting ||
                  !snapshot.hasData ||
                  snapshot.data == null) {
                return const Center(child: CircularProgressIndicator());
              } else if (snapshot.hasError) {
                return const Center(child: Text('Error fetching location'));
              }

              final places = snapshot.data!;

              return SingleChildScrollView(
                child: Column(
                  children: [
                    SizedBox(
                      width: double.infinity,
                      height: MediaQuery.of(context).size.height * 0.5,
                      child: MapView(
                        controller: _mapController,
                        initialLocation: LatLng(
                          currentLocation.latitude,
                          currentLocation.longitude,
                        ),
                        places: places,
                      ),
                    ),
                    const SizedBox(height: 32),
                    ListTile(
                      leading: Icon(Icons.location_on),
                      title: Text(
                        'Nearby Places',
                        style: Theme.of(context).textTheme.titleMedium,
                      ),
                    ),
                    const SizedBox(height: 8),
                    ListView.builder(
                      shrinkWrap: true,
                      itemCount: places.length,
                      physics: NeverScrollableScrollPhysics(),
                      itemBuilder:
                          (context, index) => PlaceTile(
                            onTap: () {
                              _mapController.move(
                                places[index].location.toLatLng(),
                                50,
                              );
                            },
                            place: places[index],
                          ),
                    ),
                  ],
                ),
              );
            },
          );
        },
      ),
    );
  }
}
