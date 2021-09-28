import 'package:flutter/material.dart';
import 'package:vamos/ui/utils/color.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

Widget tabIndicatorKRed(String text) {
  return Container(
    height: 30.h,
    width: 110.h,
    decoration:
        BoxDecoration(borderRadius: BorderRadius.circular(5), color: KRed),
    child: Center(
      child: Text(
        text,
        style: TextStyle(color: titleText, fontSize: 11.sp),
      ),
    ),
  );
}
