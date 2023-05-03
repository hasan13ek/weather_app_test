import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app_test/blocs/weather_bloc/weather_event.dart';
import 'package:weather_app_test/blocs/weather_bloc/weather_state.dart';
import 'package:weather_app_test/data/models/my_response.dart';
import 'package:weather_app_test/data/repositories/app_repository.dart';
import 'package:weather_app_test/data/service/get_it.dart';

class WeatherBloc extends Bloc<WeatherEvent, WeatherState> {
  WeatherBloc() : super(Initial()) {
    on<GetHourlyDailyWeather>(getHourlyDailyWeather);
    on<GetWeatherMainDataByQuery>(getWeatherMainDataByQuery);
    on<GetWeatherMainDataByLocation>(getWeatherMainDataByLocation);
  }

  getWeatherMainDataByQuery(
      GetWeatherMainDataByQuery event, Emitter<WeatherState> emit) async {
    emit(LoadInProgressByQuery());
    MyResponse myResponse = await getIt
        .get<AppRepository>()
        .getWeatherMainDataByQuery(query: event.query);
    if (myResponse.error.isEmpty) {
      emit(LoadInSuccessByQuery(weather: myResponse.data));
    } else {
      emit(LoadInFailureByQuery(errorText: myResponse.error));
    }
  }

  getWeatherMainDataByLocation(
      GetWeatherMainDataByLocation event, Emitter<WeatherState> emit) async {
    emit(LoadInProgressByLocation());
    MyResponse myResponse = await getIt
        .get<AppRepository>()
        .getWeatherMainDataByLocation(latLong: event.latLong);
    MyResponse myResponse1 = await getIt
        .get<AppRepository>()
        .getHourlyDailyWeather(latLong: event.latLong);
    if (myResponse.error.isEmpty) {
      emit(LoadInSuccessByLocation(
          weather: myResponse.data, oneCallData: myResponse1.data));
    } else {
      emit(LoadInFailureByLocation(errorText: myResponse.error));
    }
  }

  getHourlyDailyWeather(
      GetHourlyDailyWeather event, Emitter<WeatherState> emit) async {
    emit(LoadInProgressByHourly());
    MyResponse myResponse = await getIt
        .get<AppRepository>()
        .getHourlyDailyWeather(latLong: event.latLong);
    if (myResponse.error.isEmpty) {
      emit(LoadInSuccessByHourly(oneCallData: myResponse.data));
    } else {
      emit(LoadInFailureByHourly(errorText: myResponse.error));
    }
  }
}
