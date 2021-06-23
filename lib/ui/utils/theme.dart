import 'package:flutter/material.dart';
import 'package:vamos/ui/utils/color.dart';

ThemeData themeData() {
  return ThemeData(
    fontFamily: 'Helvetica',
    textTheme: TextTheme(
      headline1: TextStyle(
          fontWeight: FontWeight.w800, fontSize: 36, color: kLogoColor2),
    ),
  );
}
