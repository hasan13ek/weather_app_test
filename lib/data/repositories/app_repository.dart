import 'package:weather_app_test/data/models/helper/lat_lon.dart';
import 'package:weather_app_test/data/models/my_response.dart';
import 'package:weather_app_test/data/service/api_service/api_service.dart';
import 'package:weather_app_test/data/service/get_it.dart';

class AppRepository {

  Future<MyResponse> getWeatherMainDataByQuery({required String query}) async =>
      getIt.get<ApiService>().getWeatherMainDataByQuery(query: query);

  Future<MyResponse> getWeatherMainDataByLocation({required LatLong latLong}) async =>
      getIt.get<ApiService>().getWeatherMainDataByLocation(latLong: latLong);

  Future<MyResponse> getHourlyDailyWeather({required LatLong latLong}) async =>
      getIt.get<ApiService>().getHourlyDailyWeather(latLong: latLong);

}
