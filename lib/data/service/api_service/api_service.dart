import 'package:dio/dio.dart';
import 'package:weather_app_test/data/models/detail/one_call_data.dart';
import 'package:weather_app_test/data/models/helper/lat_lon.dart';
import 'package:weather_app_test/data/models/my_response.dart';
import 'package:weather_app_test/data/models/weather_main_model.dart';
import 'package:weather_app_test/data/service/api_service/api_client.dart';
import 'package:weather_app_test/utils/constants.dart';

class ApiService extends ApiClient {
  Future<MyResponse> getWeatherMainDataByQuery({required String query}) async {
    var queryParams = {"appid": apiKey, "q": query};
    MyResponse myResponse = MyResponse(error: "");
    try {
      Response response = await dio.get(
          "${dio.options.baseUrl}/data/2.5/weather",
          queryParameters: queryParams);
      if (response.statusCode! >= 200 && response.statusCode! < 300) {
        myResponse.data = WeatherMainModel.fromJson(response.data);
      }
    } catch (e) {
      print(e.toString());
      myResponse.error = 'error';
    }
    return myResponse;
  }

  Future<MyResponse> getWeatherMainDataByLocation(
      {required LatLong latLong}) async {
    var queryParams = {
      "lat": latLong.lat.toString(),
      "lon": latLong.long.toString(),
      "appid": apiKey
    };
    MyResponse myResponse = MyResponse(error: "");
    try {
      Response response = await dio.get(
          "${dio.options.baseUrl}/data/2.5/weather",
          queryParameters: queryParams);
      if (response.statusCode! >= 200 && response.statusCode! < 300) {
        myResponse.data = WeatherMainModel.fromJson(response.data);
      }
      print('NIMADIR XATO');
    } catch (e) {
      print(e.toString());
      myResponse.error = 'error';
    }
    return myResponse;
  }

  Future<MyResponse> getHourlyDailyWeather({required LatLong latLong}) async {
    var queryParams = {
      "lat": latLong.lat.toString(),
      "lon": latLong.long.toString(),
      "units": "metric",
      "exclude": "minutely,current",
      "appid": apiKey
    };
    MyResponse myResponse = MyResponse(error: "");
    try {
      Response response = await dio.get(
          "${dio.options.baseUrl}/data/2.5/onecall",
          queryParameters: queryParams);
      if (response.statusCode! >= 200 && response.statusCode! < 300) {
        myResponse.data = OneCallData.fromJson(response.data);
      }
    } catch (e) {
      print(e.toString());
      myResponse.error = 'error';
    }
    return myResponse;
  }
}
