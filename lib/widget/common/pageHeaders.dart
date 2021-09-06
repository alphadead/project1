import 'package:flutter/material.dart';
import 'package:vamos/ui/utils/color.dart';
import 'package:vamos/ui/utils/theme.dart';

import 'package:flutter_screenutil/flutter_screenutil.dart';

Widget pageHeader(String text, String assetPath) {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.center,
    mainAxisAlignment: MainAxisAlignment.start,
    children: [
      Container(
        margin: EdgeInsets.symmetric(vertical: 20.h),
        child: Column(
          children: [
            Container(
              margin: EdgeInsets.only(bottom: 10.h),
              height: 56.h,
              child: Image.asset(assetPath),
            ),
            Text(
             text,
              style: themeData().textTheme.bodyText1!.copyWith(
                    color: profileContainerColor,
                    fontSize: 12.sp,
                    fontWeight: FontWeight.bold,
                  ),
            ),
          ],
        ),
      ),
    ],
  );
}
