import 'package:flutter/material.dart';
import 'package:vamos/ui/utils/color.dart';

ThemeData themeData() {
  return ThemeData(
    fontFamily: 'Helvetica',
    textTheme: TextTheme(
      headline1: TextStyle(
          fontWeight: FontWeight.normal, fontSize: 15, color: titleText),
    ),
  );
}
