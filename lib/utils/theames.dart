import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:theinternet_folks/utils/color.dart';

class AppTheame {
  static final ThemeData lighttheme = ThemeData(
      scaffoldBackgroundColor: backgroundcolor,
      fontFamily: "Inter",
      appBarTheme: AppBarTheme(backgroundColor: backgroundcolor, elevation: 0),
      colorScheme: const ColorScheme.light(
          primary: primarycolor, onPrimary: primarycolor),
      textTheme: TextTheme(
          titleLarge: TextStyle(
              fontSize: 35.sp,
              fontWeight: FontWeight.w400,
              fontFamily: "Inter",
              color: textcolor1),
          titleMedium: TextStyle(
              fontSize: 15.sp, fontWeight: FontWeight.w500, color: textcolor1),
          titleSmall: TextStyle(
              color: textcolor2,
              fontSize: 13.sp,
              fontWeight: FontWeight.w400)));
}
