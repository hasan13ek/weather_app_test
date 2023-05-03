import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:weather_app_test/utils/colors.dart';
import 'package:weather_app_test/utils/styles.dart';

class TextWidget extends StatelessWidget {
  const TextWidget({Key? key,required this.text}) : super(key: key);
  final String text;
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      color: MyColors.white,
      child:  Padding(
        padding:
        EdgeInsets.only(left: 16.r, bottom: 16.r, top: 24.r),
        child: Text(
          text.tr(),
          style:
          MyTextStyle.interMedium500.copyWith(fontSize: 20.sp),
        ),
      ),
    );
  }
}
