import 'package:flutter/material.dart';
import 'package:vamos/ui/utils/color.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

Widget primaryActionButton(void Function() onTap, bool enabled, String text) {
  return GestureDetector(
    onTap: onTap,
    child: Container(
      height: 30.h,
      width: 110.h,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(5),
          color: enabled ? KRed : moneyBox.withOpacity(0.2)),
      child: Center(
        child: Text(
          text,
          style: TextStyle(color: titleText, fontSize: 11.sp),
        ),
      ),
    ),
  );
}
