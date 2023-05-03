import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:weather_app_test/utils/constants.dart';


class ApiClient {
  ApiClient() {
    _init();
  }

  late Dio dio;

  _init() {
    dio = Dio(
      BaseOptions(
        baseUrl: baseUrl,
        connectTimeout: 35000,
        receiveTimeout: 30000,
      ),
    );
    dio.interceptors.add(InterceptorsWrapper(onError: ((error, handler) {
      debugPrint('ERROR OCCURRED:${error.response?.statusCode}');
      return handler.next(error);
    }), onRequest: (requestOptions, handler) {
      return handler.next(requestOptions);
    }, onResponse: (Response response, ResponseInterceptorHandler handler) {
      debugPrint("RESPONSE HAS RECEIVED");
      return handler.next(response);
    }));
  }
}
