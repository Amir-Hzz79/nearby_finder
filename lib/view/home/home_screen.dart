import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:geolocator/geolocator.dart';
import 'package:latlong2/latlong.dart';
import 'package:nearby_finder/core/get_it.dart';

import '../../core/theme/theme_provider.dart';
import '../../services/location_service.dart';
import '../widgets/map_view.dart';

class HomeScreen extends ConsumerStatefulWidget {
  const HomeScreen({super.key});

  @override
  ConsumerState<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends ConsumerState<HomeScreen> {
  late Future<Position?> _futureCurrentPosition;
  @override
  void initState() {
    super.initState();
    _fetchUserLocation();
  }

  Future<void> _fetchUserLocation() async {
    final locationService = getIt<LocationService>();

    try {
      _futureCurrentPosition = locationService.getCurrentLocation();
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
        body: Column(
          children: [
            FutureBuilder(
              future: _futureCurrentPosition,
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return const Center(child: CircularProgressIndicator());
                } else if (snapshot.hasError) {
                  return const Center(child: Text('Error fetching location'));
                } else if (!snapshot.hasData || snapshot.data == null) {
                  return const Center(
                    child: Text('No location data available'),
                  );
                }

                final position = snapshot.data!;

                return SizedBox(
                  width: double.infinity,
                  height: 500,
                  child: MapView(
                    initialLocation: LatLng(
                      position.latitude,
                      position.longitude,
                    ),
                    locations: [],
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
