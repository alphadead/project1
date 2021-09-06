import 'package:flutter/material.dart';
import 'package:vamos/ui/utils/color.dart';
import 'package:vamos/ui/utils/theme.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class LoginPageIndicator extends StatelessWidget {
  final count;
  final page;
  final active;
  const LoginPageIndicator({this.count, this.page, this.active = false});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          height: 34.h,
          width: 34.w,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(3),
            color: active ? bgroundCol : inactiveColor,
          ),
          child: Center(
            child: Text(
              count,
              style: themeData().textTheme.headline1,
            ),
          ),
        ),
        SizedBox(height: 3.h),
        Text(
          page,
          style: themeData().textTheme.headline1!.copyWith(
              color: active ? bgroundCol : inactiveColor, fontSize: 12),
        ),
      ],
    );
  }
}
