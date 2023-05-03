import 'package:flutter/material.dart';
import 'package:weather_app_test/data/models/detail/one_call_data.dart';
import 'package:weather_app_test/screens/home_page.dart';
import 'package:weather_app_test/screens/language_screen.dart';
import 'package:weather_app_test/screens/splash_page.dart';
import 'package:weather_app_test/utils/constants.dart';
class MyRouter {
  static Route? generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case mainScreen:
        return navigateTo( HomeScreen());
      case splashScreen:
        return navigateTo( SplashScreen());
        case languageScreen:
        return navigateTo( LanguageScreen(oneCallData: settings.arguments as OneCallData,));
      default:
        return navigateTo(
          Scaffold(
            body: Center(child: Text('No route defined for ${settings.name}')),
          ),
        );
    }
  }
}

MaterialPageRoute navigateTo(Widget widget) => MaterialPageRoute(
  builder: (context) => widget,
);
