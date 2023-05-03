import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:weather_app_test/blocs/weather_bloc/weather_bloc.dart';
import 'package:weather_app_test/cubits/location_permission/location_permission_cubit.dart';
import 'package:weather_app_test/screens/route.dart';
import 'package:weather_app_test/utils/constants.dart';
import 'package:easy_localization/easy_localization.dart';



class App extends StatelessWidget {
  const App({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return EasyLocalization(
      supportedLocales: const [
        Locale('ru', 'RU'),
        Locale('en', 'EN'),
        Locale('uz', 'UZ')
      ],
      startLocale: const Locale('en', 'EN'),
      path: 'assets/translations',
      fallbackLocale: const Locale("en", "EN"),
      child: MultiBlocProvider(
        providers: [
          BlocProvider(create: (context) => WeatherBloc()),
          BlocProvider(create: (context) => LocationPermissionCubit()),
        ],
        child:  MyApp(),
      ),
    );




  }
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(375, 812),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (context, child) =>  MaterialApp(
        title: 'Weather app By Hasan',
        debugShowCheckedModeBanner: false,
        supportedLocales: context.supportedLocales,
        localizationsDelegates: context.localizationDelegates,
        locale: context.locale,
        onGenerateRoute: MyRouter.generateRoute,
        initialRoute: splashScreen,
      ),
    );
  }
}
