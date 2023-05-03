import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:weather_app_test/blocs/weather_bloc/weather_bloc.dart';
import 'package:weather_app_test/blocs/weather_bloc/weather_state.dart';
import 'package:weather_app_test/screens/widgets/drawer_widget.dart';
import 'package:weather_app_test/screens/widgets/my_custom_appbar.dart';
import 'package:weather_app_test/screens/widgets/shimmer_widget_home.dart';
import 'package:weather_app_test/screens/widgets/text_widget.dart';
import 'package:weather_app_test/screens/widgets/weather_daily_widget.dart';
import 'package:weather_app_test/screens/widgets/weather_hourly_widget.dart';
import 'package:weather_app_test/screens/widgets/weather_info_widget.dart';
import 'package:weather_app_test/utils/colors.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  String query = '';
  final GlobalKey<ScaffoldState> _key = GlobalKey();


  @override
  Widget build(BuildContext context) {
    return BlocBuilder<WeatherBloc, WeatherState>(
      builder: (context, state) {
        if (state is LoadInSuccessByLocation) {
          return Scaffold(
            key: _key,
            drawer: MyDrawer(
              oneCallData: state.oneCallData,
              onChanged: (value) {
                setState(() {});
              },
            ),
            backgroundColor: MyColors.primary,
            appBar: MyCustomAppBar(
              onSearchTap: (value) => setState(
                    () {
                  query = value;
                },
              ),
              title: '',
            ),
            body: SingleChildScrollView(
              // physics: const BouncingScrollPhysics(),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  WeatherInfoWidget(
                    weatherMainModel: state.weather,
                    oneCallData: state.oneCallData,
                  ),
                  TextWidget(text: 'Hourly weather'),
                  WeatherHourlyWidget(oneCallData: state.oneCallData),
                  TextWidget(text: 'Daily weather'),
                  WeatherDailyWidget(oneCallData: state.oneCallData)
                ],
              ),
            ),
          );

        } else if (state is LoadInSuccessByQuery) {
          return Text(state.weather.name);
        } else if (state is LoadInProgressByLocation) {
          return const ShimmerWidgetByHomeScreen();
        } else if (state is LoadInProgressByHourly) {
          return const ShimmerWidgetByHomeScreen();
        }
        return const ShimmerWidgetByHomeScreen();
      },
    );

  }
}
