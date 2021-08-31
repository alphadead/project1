import 'package:flutter/material.dart';
import 'package:vamos/ui/utils/color.dart';
import 'package:vamos/ui/utils/theme.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class GroundScheduleWidget extends StatelessWidget {
  final String text;
  final String time;
  const GroundScheduleWidget({required this.text, required this.time, Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: 10.h),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Text(
            "10:20",
            style: themeData().textTheme.bodyText1!.copyWith(
                  color: KGreyTextUpcomingmatches.withOpacity(0.5),
                  fontSize: 12.sp,
                  fontWeight: FontWeight.bold,
                ),
          ),
          Card(
            margin: EdgeInsets.only(left: 10.w),
            child: Container(
              height: 40.h,
              width: 250.w,
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
                    GestureDetector(
                      onTap: () {},
                      child: Container(
                        height: 25.h,
                        width: 25.h,
                        padding: EdgeInsets.all(4.h),
                        child: Image.asset(
                          "assets/images/pencil.png",
                        ),
                        color: containerGreen,
                      ),
                    )
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
