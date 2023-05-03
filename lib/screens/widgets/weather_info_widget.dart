import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:weather_app_test/blocs/weather_bloc/weather_bloc.dart';
import 'package:weather_app_test/blocs/weather_bloc/weather_event.dart';
import 'package:weather_app_test/data/models/detail/one_call_data.dart';
import 'package:weather_app_test/data/models/helper/lat_lon.dart';
import 'package:weather_app_test/data/models/weather_main_model.dart';
import 'package:weather_app_test/utils/colors.dart';
import 'package:weather_app_test/utils/styles.dart';

class WeatherInfoWidget extends StatelessWidget {
  const WeatherInfoWidget(
      {Key? key, required this.weatherMainModel, required this.oneCallData})
      : super(key: key);

  final WeatherMainModel weatherMainModel;
  final OneCallData oneCallData;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 210.h,
      width: double.infinity,
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          colors: MyColors.blueBar,
          end: Alignment.bottomLeft,
          begin: Alignment.topLeft,
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
            width: 60.w,
            height: 60.h,
            decoration: const BoxDecoration(
                shape: BoxShape.circle, color: MyColors.white),
            child: Center(
              child: Image.network(
                'http://openweathermap.org/img/w/${weatherMainModel.weatherModel[0].icon}.png',
                width: 72.w,
                height: 72.h,
              ),
            ),
          ),
          IconButton(
            onPressed: () {
              LatLong latLong =
                  LatLong(lat: oneCallData.lat, long: oneCallData.lon);
              BlocProvider.of<WeatherBloc>(context)
                  .add(GetWeatherMainDataByLocation(latLong: latLong));
              BlocProvider.of<WeatherBloc>(context)
                  .add(GetHourlyDailyWeather(latLong: latLong));
            },
            icon: const Icon(
              Icons.refresh,
              color: MyColors.white,
            ),
          ),
          SizedBox(
            height: 14.h,
          ),
          Text(
            "${oneCallData.hourly[0].temp.toInt()}°C",
            style: MyTextStyle.interMedium500
                .copyWith(fontSize: 26.sp, color: MyColors.white),
          ),
          SizedBox(
            height: 4.h,
          ),
          Text(
            weatherMainModel.name,
            style: MyTextStyle.interSemiBold600
                .copyWith(fontSize: 26.sp, color: MyColors.white),
          ),
          SizedBox(height: 10.h,),
        ],
      ),
    );
  }
}
