import 'package:flutter/material.dart';

import '../../constants/colors.dart';

class TNavigationBarTheme {
  TNavigationBarTheme._();

  static const lightNavigationBarTheme = NavigationBarThemeData(
      labelBehavior: NavigationDestinationLabelBehavior.alwaysShow,
      backgroundColor: TColors.primary,
      indicatorColor: TColors.accent,
      elevation: 0,
      iconTheme: MaterialStatePropertyAll(
        IconThemeData(
          color: TColors.white),
      ),
      labelTextStyle: MaterialStatePropertyAll(
        TextStyle(
            fontSize: 12.0, fontWeight: FontWeight.w600, color: TColors.accent),
      ));

  static const darkNavigationBarTheme = NavigationBarThemeData(
      backgroundColor: TColors.primary,
      indicatorColor: TColors.accent,
      elevation: 0,
      labelTextStyle: MaterialStatePropertyAll(
        TextStyle(
            fontSize: 12.0, fontWeight: FontWeight.w600, color: TColors.accent),
      ));
}
