import 'package:flutter/material.dart';
import 'package:vamos/ui/utils/color.dart';
import 'package:vamos/ui/utils/loginbkground.dart';
import 'package:vamos/widget/customAppBar.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:vamos/ui/utils/theme.dart';

Widget conttxt(String text) {
  return Container(
    decoration:
        BoxDecoration(color: moneyBox, borderRadius: BorderRadius.circular(3)),
    width: 125.w,
    height: 20.h,
    child: Center(
        child: Text(
      text,
      style: themeData().textTheme.headline3,
    )),
  );
}
