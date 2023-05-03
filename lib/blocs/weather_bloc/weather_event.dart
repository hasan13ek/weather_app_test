import 'package:weather_app_test/data/models/helper/lat_lon.dart';

abstract class WeatherEvent {}

class GetWeatherMainDataByQuery extends WeatherEvent {
  String query;

  GetWeatherMainDataByQuery({required this.query});
}

class GetWeatherMainDataByLocation extends WeatherEvent {
  LatLong latLong;

  GetWeatherMainDataByLocation({required this.latLong});
}

class GetHourlyDailyWeather extends WeatherEvent {
  LatLong latLong;

  GetHourlyDailyWeather({required this.latLong});
}
