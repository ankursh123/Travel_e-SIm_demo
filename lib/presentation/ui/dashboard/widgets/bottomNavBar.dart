import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:mvvm_demo_persatation_1/app/utils/commonDimension.dart';
import '../../../../app/config/colorPalette.dart';
import '../../../../app/utils/commonImages.dart';

class CustomBottomNavBar {
  BottomNavigationBarItem bottomNavItem(String title) {
    return BottomNavigationBarItem(
      label: title,
      activeIcon: Padding(
        padding: const EdgeInsets.only(bottom: CommonDimension.dp8_0, top: CommonDimension.dp10_0),
        child: SvgPicture.asset(AppImages.icStore,
            height: CommonDimension.dp20_0, width: CommonDimension.dp20_0, color: ColorPalette.white),
      ),
      icon: Padding(
        padding: const EdgeInsets.only(bottom: CommonDimension.dp8_0, top: CommonDimension.dp10_0),
        child: SvgPicture.asset(AppImages.icStore,
            height: CommonDimension.dp20_0,
            width: CommonDimension.dp20_0,
            color: ColorPalette.colorGrey),
      ),
    );
  }
}
