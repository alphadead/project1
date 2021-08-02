import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:vamos/core/service/controller/authController.dart';
import 'package:vamos/ui/utils/color.dart';
import 'package:vamos/ui/utils/loginbkground.dart';
import 'package:vamos/widget/customAppBar.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:vamos/ui/utils/theme.dart';

Widget TeamSizeButton(int currentSize, int _teamSize) {
  return Container(
    decoration: BoxDecoration(
        color: currentSize == _teamSize ? sliderGreenActive : moneyBox,
        borderRadius: BorderRadius.circular(3)),
    width: 125.w,
    height: 20.h,
    child: Center(
        child: Text(
      "$_teamSize x $_teamSize Team",
      style: themeData().textTheme.headline3,
    )),
  );
}
