import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:weather_app_test/data/models/detail/one_call_data.dart';
import 'package:weather_app_test/screens/widgets/detail_info.dart';
import 'package:weather_app_test/utils/colors.dart';
import 'package:weather_app_test/utils/my_utils.dart';
import 'package:weather_app_test/utils/styles.dart';
import 'package:zoom_tap_animation/zoom_tap_animation.dart';

class WeatherDailyWidget extends StatelessWidget {
  const WeatherDailyWidget({Key? key, required this.oneCallData})
      : super(key: key);

  final OneCallData oneCallData;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      color: MyColors.white,
      child:
      Padding(
        padding: EdgeInsets.only(left: 16.r, right: 16.r),
        child: Wrap(
          children:
          List.generate(
            oneCallData.daily.length,
            (index) {
              return ZoomTapAnimation(
                onTap: () {
                  showModalBottomSheet(
                    context: context,
                    builder: (BuildContext context) {
                      return DetailInfo(oneCallData: oneCallData,index: index,);
                    },
                    isScrollControlled: true,
                    enableDrag: true,
                    elevation: 7,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(52.0)),
                    backgroundColor: Colors.white,
                  );
                },
                child: Padding(
                  padding: EdgeInsets.only(top: 12.r, bottom: 12.r),
                  child: Container(
                    padding: EdgeInsets.only(left: 16.r, right: 16.r),
                    width: double.infinity,
                    height: 72.h,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(16.r),
                      color: MyColors.white,
                      boxShadow: [
                        BoxShadow(
                          color: const Color(0xff121212).withOpacity(0.08),
                          blurRadius: 8,
                        )
                      ],
                    ),
                    child: Row(
                      children: [
                        Container(
                          width: 50.w,
                          height: 50.h,
                          decoration: BoxDecoration(
                            color: MyColors.white,
                            shape: BoxShape.circle,
                            boxShadow: [
                              BoxShadow(
                                color:
                                    const Color(0xff121212).withOpacity(0.08),
                                blurRadius: 8,
                              )
                            ],
                          ),
                          child: Center(
                            child: Image.network(
                              'http://openweathermap.org/img/w/${oneCallData.daily[index].weather[0].icon}.png',
                              width: 72.w,
                              height: 72.h,
                            ),
                          ),
                        ),
                        SizedBox(width: 16.w),
                        Text(
                          MyUtils.weekName[index].tr(),
                          style: MyTextStyle.interSemiBold600.copyWith(
                            fontSize: 14.sp,
                            color: const Color(0xff201C1C),
                          ),
                        ),
                        const Expanded(child: SizedBox()),
                        Text(
                          "${oneCallData.daily[index].dailyTemp.day.toInt()}°C",
                          style: MyTextStyle.interMedium500.copyWith(
                            fontSize: 16.sp,
                            color: MyColors.black,
                          ),
                        ),
                        SizedBox(width: 16.w),
                        const Icon(Icons.navigate_next)
                      ],
                    ),
                  ),
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}
