import 'package:weather_app_test/data/models/detail/one_call_data.dart';
import 'package:weather_app_test/data/models/weather_main_model.dart';

abstract class WeatherState {}

class Initial extends WeatherState {}

/// 1 get weather main data by query states

class LoadInProgressByQuery extends WeatherState {}

class LoadInFailureByQuery extends WeatherState {
  String errorText;

  LoadInFailureByQuery({required this.errorText});
}

class LoadInSuccessByQuery extends WeatherState {
  WeatherMainModel weather;

  LoadInSuccessByQuery({required this.weather});
}

/// 2 get weather main dat by location states

class LoadInProgressByLocation extends WeatherState {}

class LoadInFailureByLocation extends WeatherState {
  String errorText;

  LoadInFailureByLocation({required this.errorText});
}

class LoadInSuccessByLocation extends WeatherState {
  WeatherMainModel weather;
  OneCallData oneCallData;

  LoadInSuccessByLocation({required this.weather,required this.oneCallData});
}

/// 3 get hourly daily weather states

class LoadInProgressByHourly extends WeatherState {}

class LoadInFailureByHourly extends WeatherState {
  String errorText;

  LoadInFailureByHourly({required this.errorText});
}

class LoadInSuccessByHourly extends WeatherState {
  OneCallData oneCallData;

  LoadInSuccessByHourly({required this.oneCallData});
}
