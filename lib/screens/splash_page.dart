import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:weather_app_test/blocs/weather_bloc/weather_bloc.dart';
import 'package:weather_app_test/blocs/weather_bloc/weather_event.dart';
import 'package:weather_app_test/cubits/location_permission/location_permission_cubit.dart';
import 'package:weather_app_test/utils/constants.dart';
import 'package:weather_app_test/utils/styles.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    BlocProvider.of<LocationPermissionCubit>(context).fetchCurrentLocation();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocConsumer<LocationPermissionCubit, LocationPermissionState>(
        builder: (context, state) {
          return Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(
                  width: 162.5.w,
                  height: 108.64.h,
                  child: Image.asset('assets/images/app_logo.png'),
                ),
                SizedBox(height: 20.h),
                const SizedBox(
                  child: Text('Weather App by Hasan',
                      style: MyTextStyle.interMedium500),
                ),
              ],
            ),
          );
        },
        listener: (context, state) {
          if (state.myPermissionStatus == MyPermissionStatus.Loading) {}
          if (state.myPermissionStatus == MyPermissionStatus.Success) {
            BlocProvider.of<WeatherBloc>(context).add(
              GetWeatherMainDataByLocation(latLong: state.latLongModel!),
            );
            BlocProvider.of<WeatherBloc>(context).add(
              GetHourlyDailyWeather(latLong: state.latLongModel!),
            );
            Navigator.pushReplacementNamed(context, mainScreen);
          }
          if (state.myPermissionStatus == MyPermissionStatus.Fail) {
            BlocProvider.of<WeatherBloc>(context)
                .add(GetWeatherMainDataByQuery(query: 'Kiyev'));
          }
        },
      ),
    );
  }
}
