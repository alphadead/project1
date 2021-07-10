import 'package:flutter/widgets.dart';
import 'package:vamos/ui/utils/color.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

Widget circleIcons(String location) {
  return Container(
    height: 100.h,
    width: 80.w,
    decoration: BoxDecoration(
      shape: BoxShape.circle,
      border: Border.all(
        color: sliderGreenActive,
        style: BorderStyle.solid,
        width: 1.0,
      ),
    ),
    child: Center(
      child: Image.asset(
        location,
        scale: 2.5,
      ),
    ),
  );
}
