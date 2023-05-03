import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app_test/blocs/weather_bloc/weather_bloc.dart';
import 'package:weather_app_test/blocs/weather_bloc/weather_event.dart';
import 'package:weather_app_test/screens/widgets/search_delegate_view.dart';
import 'package:weather_app_test/utils/colors.dart';
import 'package:weather_app_test/utils/my_utils.dart';

class MyCustomAppBar extends StatelessWidget implements PreferredSize {
  const MyCustomAppBar({
    Key? key,
    required this.onSearchTap,
    required this.title,
  }) : super(key: key);

  final ValueChanged<String> onSearchTap;
  final String title;

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: MyColors.primary,
      elevation: 0,
      actions: [
        IconButton(
            onPressed: () async {
              var searchText = await showSearch(
                context: context,
                delegate:
                    SearchDelegateView(suggestionList: MyUtils.getPlaceNames()),
              );
              onSearchTap.call(searchText);
            },
            icon: const Icon(
              Icons.search,
              color: Colors.white,
            )),

      ],
      systemOverlayStyle: const SystemUiOverlayStyle(
        statusBarBrightness: Brightness.light,
        statusBarIconBrightness: Brightness.light,
        systemNavigationBarColor: MyColors.white,
        systemNavigationBarIconBrightness: Brightness.dark
      ),
    );
  }

  @override
  Widget get child => throw UnimplementedError();

  @override
  Size get preferredSize => const Size(double.infinity, 60);
}
