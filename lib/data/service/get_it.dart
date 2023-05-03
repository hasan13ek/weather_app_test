import 'package:get_it/get_it.dart';
import 'package:weather_app_test/blocs/weather_bloc/weather_bloc.dart';
import 'package:weather_app_test/cubits/location_permission/location_permission_cubit.dart';
import 'package:weather_app_test/data/repositories/app_repository.dart';
import 'package:weather_app_test/data/service/api_service/api_service.dart';

final getIt = GetIt.instance;

void setup() {
  getIt.registerLazySingleton(() => ApiService());
  getIt.registerLazySingleton(() => AppRepository());
  getIt.registerLazySingleton(() => WeatherBloc());
  getIt.registerLazySingleton(() => LocationPermissionCubit());
}
