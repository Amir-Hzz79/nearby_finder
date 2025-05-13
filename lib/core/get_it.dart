import 'package:get_it/get_it.dart';

import '../services/location_service.dart';

final GetIt getIt = GetIt.instance;

void setupLocator() {
  getIt.registerLazySingleton<LocationService>(() => LocationService());
}
