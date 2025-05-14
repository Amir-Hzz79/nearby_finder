import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:nearby_finder/core/data/database/places_dao.dart';

import 'data/database/database.dart';
import 'services/location_service.dart';

final GetIt getIt = GetIt.instance;

void setupLocator() {
  final dio = Dio();

  getIt.registerLazySingleton<Dio>(() => dio);
  getIt.registerLazySingleton<LocationService>(() => LocationService(dio));

  final PlacesDatabase db = PlacesDatabase();
  getIt.registerLazySingleton<PlacesDao>(() => PlacesDao(db));
}
