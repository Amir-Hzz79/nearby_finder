import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';

import '../services/location_service.dart';

final GetIt getIt = GetIt.instance;

void setupLocator() {
  final dio = Dio();

  getIt.registerLazySingleton<Dio>(() => dio);
  getIt.registerLazySingleton<LocationService>(() => LocationService(dio));
}
