import 'package:flutter/material.dart';
import 'package:vamos/ui/utils/color.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

ThemeData themeData() {
  return ThemeData(
    textSelectionTheme: TextSelectionThemeData(
      cursorColor: Colors.green,
    ),
    inputDecorationTheme: InputDecorationTheme(
      labelStyle: TextStyle(color: labelText),
      focusedBorder:
          UnderlineInputBorder(borderSide: BorderSide(color: Colors.green)),
    ),
    fontFamily: 'Poppins',
    textTheme: TextTheme(
        headline1: TextStyle(
            fontWeight: FontWeight.normal, fontSize: 15.sp, color: titleText),
        headline2: TextStyle(
            fontWeight: FontWeight.normal,
            fontSize: 11.sp,
            color: Colors.white)),
  );
}
