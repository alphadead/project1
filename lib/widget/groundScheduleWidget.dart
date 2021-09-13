import 'package:flutter/material.dart';
import 'package:vamos/ui/utils/color.dart';
import 'package:vamos/ui/utils/theme.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class GroundScheduleWidget extends StatelessWidget {
  final String text;
  final String opentime;
  final String closeTime;
  const GroundScheduleWidget(
      {required this.text,
      required this.opentime,
      required this.closeTime,
      Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: 10.h),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Text(
                opentime,
                style: themeData().textTheme.bodyText1!.copyWith(
                      color: bgroundCol,
                      fontSize: 12.sp,
                      fontWeight: FontWeight.bold,
                    ),
              ),
              Text(
                closeTime,
                style: themeData().textTheme.bodyText1!.copyWith(
                      color: KRed,
                      fontSize: 12.sp,
                      fontWeight: FontWeight.bold,
                    ),
              ),
            ],
          ),
          Card(
            margin: EdgeInsets.only(left: 10.w),
            child: Container(
              height: 40.h,
              width: .6.sw,
              child: Container(
                margin: EdgeInsets.symmetric(horizontal: 15.w),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      text,
                      style: themeData().textTheme.bodyText1!.copyWith(
                            fontSize: 10.sp,
                            fontWeight: FontWeight.bold,
                          ),
                    ),
                  ],
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
