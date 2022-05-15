import 'package:ekub/theme/app_color.dart';
import 'package:flutter/material.dart';

class AppTheme {
  static ThemeData lightTheme = ThemeData.from(
    // fontFamily: 'Poppins',
    colorScheme: ColorScheme.light(
        primary: AppColor.primaryColor,
        // onPrimary: AppColor.darkBlue,
        // onSecondary: AppColor.darkBlue,
        secondary: AppColor.primaryColor),
    // textTheme: TextTheme(
    //   subtitle1: TextStyle(
    //       fontSize: 18,
    //       fontWeight: FontWeight.bold,
    //       color: AppColor.primaryColor),
    //   bodyText2: TextStyle(color: AppColor.primaryColor),
    //   headline6: TextStyle(
    //     fontWeight: FontWeight.bold,
    //     fontSize: 25,
    //     color: AppColor.primaryColor,
    //   ),
    // ),
  );
  // static ThemeData darkTheme = ThemeData.from(
  //     colorScheme: ColorScheme.dark(
  //         primary: AppColor.primaryColor,
  //         onPrimary: AppColor.darkBlue,
  //         onSecondary: AppColor.darkBlue,
  //         secondary: AppColor.secondaryColor),
  //     textTheme: TextTheme(
  //       bodyText2: TextStyle(color: AppColor.secondaryColor),
  //       headline6: TextStyle(
  //           fontWeight: FontWeight.bold,
  //           fontSize: 25,
  //           color: AppColor.primaryColor),
  //     ));

}
