import 'package:flutter/material.dart';
import 'package:vamos/ui/utils/color.dart';

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
          fontWeight: FontWeight.normal, fontSize: 15, color: titleText),
    ),
  );
}
