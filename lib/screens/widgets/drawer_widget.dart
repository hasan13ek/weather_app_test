import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:weather_app_test/data/models/detail/one_call_data.dart';
import 'package:weather_app_test/utils/colors.dart';
import 'package:weather_app_test/utils/constants.dart';
import 'package:weather_app_test/utils/styles.dart';


class MyDrawer extends StatefulWidget {
  ValueChanged onChanged;
  final OneCallData oneCallData;


  MyDrawer({super.key,required this.onChanged,required this.oneCallData});

  @override
  State<MyDrawer> createState() => _MyDrawerState();
}

class _MyDrawerState extends State<MyDrawer> {

  @override
  Widget build(BuildContext context) {
    return Drawer(
      elevation: 0,
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          DrawerHeader(
            decoration: const BoxDecoration(color: MyColors.primary),
            child: Row(
              children: [
                Image.asset('assets/images/app_logo.png',
                    width: 60.w, height: 60),
                SizedBox(width: 16.w),
                Text(
                  'Weather App by Hasan',
                  style: MyTextStyle.interSemiBold600
                      .copyWith(color: MyColors.white),
                )
              ],
            ),
          ),
          ListTile(
            title:  Text('Language'.tr()),
            onTap: () {
              Navigator.pushNamed(context, languageScreen,arguments: widget.oneCallData);
            },
            leading: const Icon(Icons.language, color: MyColors.primary),
            trailing:
            const Icon(Icons.navigate_next, color: MyColors.primary),
          ),
          ListTile(
            title:  Text('About'.tr()),
            onTap: () {},
            leading: const Icon(Icons.info, color: MyColors.primary),
            trailing:
            const Icon(Icons.navigate_next, color: MyColors.primary),
          ),
          ListTile(
            title:  Text('Support'.tr()),
            onTap: () {},
            leading:
            const Icon(Icons.contact_support, color: MyColors.primary),
            trailing:
            const Icon(Icons.navigate_next, color: MyColors.primary),
          ),
        ],
      ),
    );
  }
}
