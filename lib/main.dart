import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:nearby_finder/core/theme/app_theme.dart';
import 'package:nearby_finder/features/nearby_places/presentation/screens/nearby_places_screen.dart';

import 'core/get_it.dart';
import 'core/theme/theme_provider.dart';

void main() {
  setupLocator();
  
  runApp(const ProviderScope(child: NearbyFinderApp()));
}

class NearbyFinderApp extends ConsumerWidget {
  const NearbyFinderApp({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final themeMode = ref.watch(themeModeProvider);

    return MaterialApp(
      title: 'Nearby Finder',
      theme: AppTheme.lightTheme,
      darkTheme: AppTheme.darkTheme,
      themeMode: themeMode,
      home: const NearbyPlacesScreen(),
    );
  }
}
