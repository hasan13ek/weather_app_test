import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:weather_app_test/data/models/detail/one_call_data.dart';
import 'package:weather_app_test/utils/colors.dart';
import 'package:weather_app_test/utils/my_utils.dart';
import 'package:weather_app_test/utils/styles.dart';

class WeatherHourlyWidget extends StatelessWidget {
  const WeatherHourlyWidget({Key? key, required this.oneCallData})
      : super(key: key);
  final OneCallData oneCallData;


  @override
  Widget build(BuildContext context) {
    return Container(
      color: MyColors.white,
      height: 130,
      child: ListView.builder(
        itemCount: oneCallData.hourly.length,
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, int index) {
          String date = DateTime.fromMillisecondsSinceEpoch(
                  (oneCallData.hourly[index].dt) * 1000)
              .toString()
              .substring(11, 16);
          return Padding(
            padding:
                EdgeInsets.only(left: 8.r, right: 8.r, top: 8.r, bottom: 8.r),
            child: Container(
              width: 78.w,
              height: 108.h,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(6.r),
                color: MyColors.white,
                boxShadow: [
                  BoxShadow(
                    color: const Color(0xff121212).withOpacity(0.08),
                    blurRadius: 4,
                  )
                ],
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Container(
                    width: 50.w,
                    height: 50.h,
                    decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: MyColors.white,
                        boxShadow: [
                          BoxShadow(
                              color: const Color(0xff121212).withOpacity(0.08),
                              blurRadius: 8)
                        ]),
                    child: Center(
                      child: Image.network(
                        'http://openweathermap.org/img/w/${oneCallData.hourly[index].weather[0].icon}.png',
                        width: 72.w,
                        height: 72.h,
                      ),
                    ),
                  ),
                  Text(
                    "${oneCallData.hourly[index].temp.toInt()}°C",
                    style: MyTextStyle.interMedium500
                        .copyWith(fontSize: 16.sp, color: MyColors.black),
                  ),
                  Text(
                    "$date" " ${MyUtils.pmOrAm(date)}",
                    style: MyTextStyle.interRegular400.copyWith(
                        fontSize: 14.sp, color: const Color(0xff494343)),
                  ),
                ],
              ),
            ),
          );
        },
        physics: const BouncingScrollPhysics(),
      ),
    );
  }
}
