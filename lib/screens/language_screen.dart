import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:weather_app_test/blocs/weather_bloc/weather_bloc.dart';
import 'package:weather_app_test/blocs/weather_bloc/weather_event.dart';
import 'package:weather_app_test/data/models/detail/one_call_data.dart';
import 'package:weather_app_test/data/models/helper/lat_lon.dart';
import 'package:weather_app_test/utils/colors.dart';
import 'package:weather_app_test/utils/styles.dart';
import 'package:zoom_tap_animation/zoom_tap_animation.dart';

class LanguageScreen extends StatefulWidget {
  const LanguageScreen({super.key,required this.oneCallData});
  final OneCallData oneCallData;

  @override
  State<LanguageScreen> createState() => _LanguageScreenState();
}

class _LanguageScreenState extends State<LanguageScreen> {
  int selectedLang = 0;

  @override
  Widget build(BuildContext context) {
    switch (context.locale.languageCode) {
      case 'en':
        selectedLang = 0;
        break;
      case 'ru':
        selectedLang = 1;
        break;
      case 'uz':
        selectedLang = 2;
        break;
      default:
    }
    return Scaffold(
      appBar: AppBar(
        backgroundColor: MyColors.primary,
        leading: IconButton(
          onPressed: () {
            LatLong latLong =
            LatLong(lat: widget.oneCallData.lat, long: widget.oneCallData.lon);
            BlocProvider.of<WeatherBloc>(context)
                .add(GetWeatherMainDataByLocation(latLong: latLong));
            BlocProvider.of<WeatherBloc>(context)
                .add(GetHourlyDailyWeather(latLong: latLong));
            Navigator.pop(context);
          },
          icon: const Icon(
            Icons.arrow_back,
            color: MyColors.white,
          ),
        ),
        elevation: 0,
        title:  Text(
          "Language Change".tr(),
          style: MyTextStyle.interSemiBold600,
        ),
      ),
      body: Container(
        width: double.infinity,
        padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 24).r,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Select Language".tr(),
              style: MyTextStyle.interSemiBold600,
            ),
            SizedBox(height: 24.h),
            ListView(
              shrinkWrap: true,
              children: [
                ZoomTapAnimation(
                  onTap: () {
                    context.setLocale(const Locale("en", "EN"));
                    setState(() {});
                  },
                  child: Container(
                    padding: const EdgeInsets.symmetric(horizontal: 24).r,
                    decoration: BoxDecoration(
                      boxShadow: selectedLang == 0
                          ? []
                          : [
                              const BoxShadow(
                                  color: Colors.grey,
                                  spreadRadius: 2.5,
                                  blurRadius: 8)
                            ],
                      borderRadius: BorderRadius.circular(24.r),
                      color:
                          selectedLang == 0 ? MyColors.primary : MyColors.white,
                    ),
                    height: 64.h,
                    child: Row(
                      children: [
                        Container(
                          height: 44.h,
                          width: 44.h,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(24),
                            image: const DecorationImage(
                                image: AssetImage("assets/images/usa.png"),
                                fit: BoxFit.cover),
                          ),
                        ),
                        SizedBox(width: 12.w),
                        Text(
                          "English".tr(),
                          style: MyTextStyle.interSemiBold600
                              .copyWith(fontSize: 14.sp),
                        ),
                        const Spacer(),
                        Container(
                          width: 10.w,
                          height: 10.h,
                          padding: const EdgeInsets.all(2).r,
                          decoration: BoxDecoration(
                            border: Border.all(
                              color: selectedLang == 0
                                  ? MyColors.white
                                  : MyColors.primary,
                            ),
                            borderRadius: BorderRadius.circular(6),
                          ),
                          child: Container(
                            width: 7.w,
                            height: 7.h,
                            decoration: BoxDecoration(
                              color: MyColors.white,
                              borderRadius: BorderRadius.circular(6),
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                ),
                SizedBox(height: 12.h),
                ZoomTapAnimation(
                  onTap: () {
                    context.setLocale(const Locale("ru", "RU"));
                    setState(() {});
                  },
                  child: Container(
                    padding: const EdgeInsets.symmetric(horizontal: 24).r,
                    decoration: BoxDecoration(
                      boxShadow: selectedLang == 1
                          ? []
                          : [
                              const BoxShadow(
                                  color: Colors.grey,
                                  spreadRadius: 2.5,
                                  blurRadius: 8)
                            ],
                      borderRadius: BorderRadius.circular(24.r),
                      color:
                          selectedLang == 1 ? MyColors.primary : MyColors.white,
                    ),
                    height: 64.h,
                    child: Row(
                      children: [
                        Container(
                          height: 44.h,
                          width: 44.h,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(24),
                            image: const DecorationImage(
                                image: AssetImage("assets/images/russia.png"),
                                fit: BoxFit.cover),
                          ),
                        ),
                        SizedBox(width: 12.w),
                        Text(
                          "Russian".tr(),
                          style: MyTextStyle.interSemiBold600
                              .copyWith(fontSize: 14.sp),
                        ),
                        const Spacer(),
                        Container(
                          width: 10.w,
                          height: 10.h,
                          padding: const EdgeInsets.all(2).r,
                          decoration: BoxDecoration(
                            border: Border.all(
                              color: selectedLang == 1
                                  ? MyColors.white
                                  : MyColors.primary,
                            ),
                            borderRadius: BorderRadius.circular(6),
                          ),
                          child: Container(
                            width: 7.w,
                            height: 7.h,
                            decoration: BoxDecoration(
                              color: MyColors.white,
                              borderRadius: BorderRadius.circular(6),
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                ),
                SizedBox(height: 12.h),
                ZoomTapAnimation(
                  onTap: () {
                    context.setLocale( Locale("uz", "UZ"));
                    setState(() {});
                  },
                  child: Container(
                    padding: const EdgeInsets.symmetric(horizontal: 24).r,
                    decoration: BoxDecoration(
                      boxShadow: selectedLang == 2
                          ? []
                          : [
                              const BoxShadow(
                                color: Colors.grey,
                                spreadRadius: 2.5,
                                blurRadius: 8,
                              )
                            ],
                      borderRadius: BorderRadius.circular(24.r),
                      color:
                          selectedLang == 2 ? MyColors.primary : MyColors.white,
                    ),
                    height: 64.h,
                    child: Row(
                      children: [
                        Container(
                          height: 44.h,
                          width: 44.h,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(24),
                            image: const DecorationImage(
                                image: AssetImage("assets/images/uzbek.png"),
                                fit: BoxFit.cover),
                          ),
                        ),
                        SizedBox(width: 12.w),
                        Text(
                          "Uzbek".tr(),
                          style: MyTextStyle.interSemiBold600
                              .copyWith(fontSize: 14.sp,),
                        ),
                        const Spacer(),
                        Container(
                          width: 10.w,
                          height: 10.h,
                          padding: const EdgeInsets.all(2).r,
                          decoration: BoxDecoration(
                            border: Border.all(
                                color: selectedLang == 2
                                    ? MyColors.white
                                    : MyColors.primary),
                            borderRadius: BorderRadius.circular(6),
                          ),
                          child: Container(
                            width: 7.w,
                            height: 7.h,
                            decoration: BoxDecoration(
                              color: MyColors.white,
                              borderRadius: BorderRadius.circular(6),
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
