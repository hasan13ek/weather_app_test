import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shimmer/shimmer.dart';
import 'package:weather_app_test/utils/colors.dart';
import 'package:zoom_tap_animation/zoom_tap_animation.dart';

class ShimmerWidgetByHomeScreen extends StatelessWidget {
  const ShimmerWidgetByHomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: MyColors.primary,
      appBar: AppBar(
        backgroundColor: MyColors.primary,
        elevation: 0,
      ),
      body: SingleChildScrollView(
          child: Column(
            children: [
              Shimmer.fromColors(
                  baseColor: Colors.grey[100]!,
                  highlightColor: Colors.grey[400]!,
                  child: Column(
                    children: [
                      Container(
                        margin: EdgeInsets.only(left: 12.r),
                        width: 60.w,
                        height: 60.h,
                        decoration: const BoxDecoration(
                            color: Colors.black, shape: BoxShape.circle),
                      ),
                      SizedBox(
                        height: 26.h,
                      ),
                      Container(
                        margin: EdgeInsets.only(left: 12.r),
                        width: 70.w,
                        height: 30.h,
                        decoration: BoxDecoration(
                            color: Colors.black,
                            borderRadius: BorderRadius.circular(6.r)),
                      ),
                      SizedBox(
                        height: 16.h,
                      ),
                      Container(
                        margin: EdgeInsets.only(left: 12.r),
                        width: 140.w,
                        height: 40.h,
                        decoration: BoxDecoration(
                            color: Colors.black,
                            borderRadius: BorderRadius.circular(6.r)),
                      ),
                    ],
                  )
              ),
              SizedBox(height: 10.h,),
              Container(
                width: double.infinity,
                color: MyColors.white,
                child: Column(
                  children: [
                    Shimmer.fromColors(
                        baseColor: Colors.grey[200]!,
                        highlightColor: Colors.grey[400]!,
                        child: Column(
                          children: [

                            SizedBox(
                              height: 36.h,
                            ),
                            Container(
                              margin: EdgeInsets.only(right: 202.r),
                              width: 160.w,
                              height: 34.h,
                              decoration: BoxDecoration(
                                  color: Colors.black,
                                  borderRadius: BorderRadius.circular(6.r)),
                            ),
                            SizedBox(
                              height: 16.h,
                            ),
                            SizedBox(
                              height: 130,
                              child: ListView.builder(
                                itemCount: 10,
                                scrollDirection: Axis.horizontal,
                                itemBuilder: (context, int index) {
                                  return Padding(
                                    padding: EdgeInsets.only(
                                        left: 8.r, right: 8.r, top: 8.r, bottom: 8.r),
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
                                                    color: const Color(0xff121212)
                                                        .withOpacity(0.08),
                                                    blurRadius: 8)
                                              ],
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  );
                                },
                                physics: const BouncingScrollPhysics(),
                              ),
                            ),
                            SizedBox(
                              height: 26.h,
                            ),
                            Container(
                              margin: EdgeInsets.only(right: 202.r),
                              width: 160.w,
                              height: 34.h,
                              decoration: BoxDecoration(
                                  color: Colors.black,
                                  borderRadius: BorderRadius.circular(6.r)),
                            ),
                            SizedBox(
                              height: 16.h,
                            ),
                            SizedBox(
                              width: double.infinity,
                              child: Padding(
                                padding: EdgeInsets.only(left: 16.r, right: 16.r),
                                child: Wrap(
                                  children:
                                  List.generate(
                                    7,
                                        (index) {
                                      return ZoomTapAnimation(
                                        onTap: () {},
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
                                          ),
                                        ),
                                      );
                                    },
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ))
                  ],
                ),
              )
            ],
          )

      ),
    );

  }
}

