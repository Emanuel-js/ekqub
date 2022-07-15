import 'package:ekub/theme/app_color.dart';
import 'package:flutter/material.dart';

class AppTheme {
  static ThemeData lightTheme = ThemeData.from(
    // fontFamily: 'Poppins',
    colorScheme: ColorScheme.light(
        primary: AppColor.primaryColor,
        onPrimary: AppColor.secondaryColor,
        onSecondary: AppColor.secondaryColor,
        secondary: AppColor.secondaryColor),
    textTheme: TextTheme(
      subtitle1: TextStyle(
          fontSize: 18, fontWeight: FontWeight.bold, color: AppColor.black),
      bodyText2: TextStyle(color: AppColor.secondaryColor),
      headline6: TextStyle(
        fontWeight: FontWeight.bold,
        fontSize: 25,
        color: AppColor.black,
      ),
    ),
  );
  static ThemeData darkTheme = ThemeData.from(
      colorScheme: ColorScheme.dark(
          primary: AppColor.darkGray,
          onPrimary: AppColor.white,
          onSecondary: AppColor.white,
          secondary: AppColor.secondaryColor),
      textTheme: TextTheme(
        bodyText2: TextStyle(color: AppColor.white),
        headline6: TextStyle(
            fontWeight: FontWeight.bold, fontSize: 25, color: AppColor.white),
      ));
}
