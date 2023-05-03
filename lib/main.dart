// import 'package:easy_localization/easy_localization.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:weather_app_test/app/app.dart';
import 'package:weather_app_test/app/bloc_observer.dart';
import 'package:weather_app_test/data/service/get_it.dart';
import 'package:weather_app_test/utils/colors.dart';

void main() async{
  await Hive.initFlutter();
  SystemChrome.setSystemUIOverlayStyle(
    const SystemUiOverlayStyle(
      statusBarIconBrightness: Brightness.light,
      statusBarColor: MyColors.primary,
    ),
  );
  setup();
  Bloc.observer = AppBlocObserver();
  WidgetsFlutterBinding.ensureInitialized();
  await EasyLocalization.ensureInitialized();

  runApp( App());
}

