import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:latlong2/latlong.dart';
import 'package:nearby_finder/core/get_it.dart';
import 'package:nearby_finder/models/location.dart';
import 'package:nearby_finder/view/widgets/place_tile.dart';

import '../../core/theme/theme_provider.dart';
import '../../models/place.dart';
import '../../services/location_service.dart';
import '../widgets/map_view.dart';

class HomeScreen extends ConsumerStatefulWidget {
  const HomeScreen({super.key});

  @override
  ConsumerState<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends ConsumerState<HomeScreen> {
  final LocationService locationService = getIt<LocationService>();
  late Future<Location?> _futureCurrentPosition;
  Future<List<Place>>? nearbyPlaces;
  @override
  void initState() {
    super.initState();
    _fetchUserLocation();
  }

  Future<void> _fetchUserLocation() async {
    try {
      _futureCurrentPosition = locationService.getCurrentLocation();
    } catch (e) {
      debugPrint('Error fetching location: $e');
    }
  }

  Future<void> _fetchNearbyPlaces(Location currentLocation) async {
    try {
      nearbyPlaces = locationService.getNearbyPlaces(
        currentLocation: currentLocation,
      );
      /* if (position != null) {
        ref.read(userLocationProvider.notifier).state = LatLng(
          position.latitude,
          position.longitude,
        );
      } */
    } catch (e) {
      debugPrint('Error fetching location: $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Home Page'),
          actions: [
            IconButton(
              icon: Icon(
                ref.watch(themeModeProvider) == ThemeMode.dark
                    ? Icons.dark_mode
                    : Icons.light_mode,
              ),
              onPressed:
                  () => ref.read(themeModeProvider.notifier).toggleTheme(),
            ),
          ],
        ),
        body: FutureBuilder(
          future: _futureCurrentPosition,
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const Center(child: CircularProgressIndicator());
            } else if (snapshot.hasError) {
              return const Center(child: Text('Error fetching location'));
            } else if (!snapshot.hasData || snapshot.data == null) {
              return const Center(child: Text('No location data available'));
            }

            final currentLocation = snapshot.data!;

            return SingleChildScrollView(
              child: Column(
                children: [
                  SizedBox(
                    width: double.infinity,
                    height: 500,
                    child: MapView(
                      initialLocation: LatLng(
                        currentLocation.latitude,
                        currentLocation.longitude,
                      ),
                      locations: [],
                    ),
                  ),
                  TextButton.icon(
                    onPressed: () {
                      _fetchNearbyPlaces(currentLocation);
                    },
                    icon: Icon(Icons.search),
                    label: Text('Find Nearby Places'),
                  ),

                  FutureBuilder(
                    future: nearbyPlaces,
                    builder: (context, snapshot) {
                      if (snapshot.connectionState == ConnectionState.waiting) {
                        return const Center(child: CircularProgressIndicator());
                      } else if (snapshot.hasError) {
                        return const Center(
                          child: Text('Error fetching locations'),
                        );
                      } else if (!snapshot.hasData || snapshot.data == null) {
                        return const SizedBox();
                      }

                      final List<Place> places = snapshot.data!;

                      return ListView.builder(
                        shrinkWrap: true,
                        itemCount: places.length,
                        physics: NeverScrollableScrollPhysics(),
                        itemBuilder:
                            (context, index) => PlaceTile(place: places[index]),
                      );
                    },
                  ),
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}
