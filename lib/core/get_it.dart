import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:nearby_finder/core/data/database/places_dao.dart';
import 'package:nearby_finder/core/services/location_prefrence_service.dart';

import 'data/database/database.dart';
import 'services/location_service.dart';

final GetIt getIt = GetIt.instance;

void setupLocator() {
  final PlacesDatabase db = PlacesDatabase();
  final placesDao = PlacesDao(db);
  getIt.registerLazySingleton<PlacesDao>(() => placesDao);

  final dio = Dio();

  getIt.registerLazySingleton<Dio>(() => dio);

  final locationPrefrenceService = LocationPrefrenceService();
  getIt.registerLazySingleton<LocationPrefrenceService>(
    () => locationPrefrenceService,
  );
  getIt.registerLazySingleton<LocationService>(
    () => LocationService(
      dio: dio,
      locationPrefrenceService: locationPrefrenceService,
      placesDao: placesDao,
    ),
  );
}
