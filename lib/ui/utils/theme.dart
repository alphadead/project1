import 'package:flutter/material.dart';
import 'package:vamos/ui/utils/color.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

ThemeData themeData() {
  return ThemeData(
    appBarTheme: AppBarTheme(
      backgroundColor: bgroundCol,
      centerTitle: true,
      //automaticallyImplyLeading: false,
    ),
    bottomNavigationBarTheme: BottomNavigationBarThemeData(
      type: BottomNavigationBarType.fixed,
      selectedLabelStyle: TextStyle(
        color: Colors.white,
        fontSize: 10.sp,
        fontWeight: FontWeight.bold,
        height: 2,
      ),
      selectedItemColor: Colors.red,
      unselectedLabelStyle: TextStyle(
        color: Colors.white,
        fontSize: 10.sp,
        fontWeight: FontWeight.bold,
        height: 2,
      ),
      showUnselectedLabels: true,
    ),
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
      headline3: TextStyle(
          color: Colors.white, fontSize: 8.sp, fontWeight: FontWeight.bold),
      headline2: TextStyle(
          fontWeight: FontWeight.normal, fontSize: 11.sp, color: Colors.white),
      headline5: TextStyle(
          fontWeight: FontWeight.normal, fontSize: 12.sp, color: Colors.black,),
      headline6: TextStyle(
          fontWeight: FontWeight.normal, fontSize: 12.sp, color: KRed,),
      headline4: TextStyle(
        fontSize: 8.8.sp,
        fontWeight: FontWeight.bold,
      ),
    ),
  );
}
