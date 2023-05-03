import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:weather_app_test/data/models/detail/one_call_data.dart';
import 'package:weather_app_test/screens/widgets/info_container.dart';
import 'package:weather_app_test/utils/icons.dart';

class DetailInfo extends StatelessWidget {
  const DetailInfo({Key? key, required this.oneCallData, required this.index})
      : super(key: key);
  final OneCallData oneCallData;
  final int index;

  @override
  Widget build(BuildContext context) {
    return Container(
        padding: EdgeInsets.only(bottom: 0.r),
        width: double.infinity,
        height: 230.h,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(32.r),
            topRight: Radius.circular(32.r),
          ),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                InfoContainerWidget(
                  image: AppIcons.svg_1,
                  data: oneCallData.daily[index].humidity,
                  infoText: 'Humidity',
                ),
                InfoContainerWidget(
                  image: AppIcons.svg_3,
                  data: oneCallData.daily[index].weather[0].main,
                  infoText: oneCallData.timezone,
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                InfoContainerWidget(
                  image: AppIcons.svg_2,
                  data: oneCallData.daily[index].windSpeed,
                  infoText: 'Km/h',
                ),
                InfoContainerWidget(
                  image: AppIcons.svg_4,
                  data: oneCallData.daily[index].dewPoint,
                  infoText: 'dew point',
                ),
              ],
            ),
          ],
        ));
  }
}
