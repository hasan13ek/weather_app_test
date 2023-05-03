import 'package:flutter/cupertino.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:weather_app_test/utils/colors.dart';
import 'package:weather_app_test/utils/styles.dart';

class InfoContainerWidget extends StatelessWidget {
  const InfoContainerWidget(
      {Key? key,
      required this.data,
      required this.image,
      required this.infoText})
      : super(key: key);

  final String image;
  final String infoText;
  final dynamic data;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(
        left: 16.r,
        right: 20.r,
      ),
      width: 164.w,
      height: 70.h,
      decoration: BoxDecoration(
        color: MyColors.white,
        borderRadius: BorderRadius.circular(16.r),
        boxShadow: [
          BoxShadow(
            color: const Color(0xff121212).withOpacity(0.1),
            blurRadius: 8,
          )
        ],
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          SvgPicture.asset(image),
          Padding(
            padding: EdgeInsets.only(top: 18.r),
            child: Column(
              children: [
                Text(
                  "$data %",
                  style: MyTextStyle.interSemiBold600.copyWith(fontSize: 16.sp),
                ),
                Text(
                  infoText,
                  style: MyTextStyle.interRegular400,
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
