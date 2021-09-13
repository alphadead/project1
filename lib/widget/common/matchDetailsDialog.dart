import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:vamos/ui/utils/color.dart';
import 'package:vamos/ui/utils/theme.dart';

Widget matchDetailsDialog(
    {required BuildContext context,
    required String groundName,
    required String groundLocation,
    required String bookingFee}) {
  return Dialog(
    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
    child: SingleChildScrollView(
      child: Padding(
        padding: EdgeInsets.only(left: 25.w, right: 17.w),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            detailsDescription(name: "Ground Name", value: groundName),
            detailsDescription(name: 'Ground Location', value: groundLocation),
            detailsDescription(name: "Booking Fee", value: bookingFee),
            SizedBox(
              height: 40.h,
            ),
          ],
        ),
      ),
    ),
  );
}

Widget detailsDescription({required String name, required String value}) {
  return Row(
    children: [
      Container(
        margin: EdgeInsets.only(top: 20.h),
        child: Text(
          "$name : ",
          style: themeData().textTheme.bodyText1!.copyWith(
                color: profileContainerColor,
                fontSize: 12.sp,
                fontWeight: FontWeight.bold,
              ),
        ),
      ),
      Container(
        margin: EdgeInsets.only(top: 20.h),
        child: Text(
          value,
          style: themeData().textTheme.bodyText1!.copyWith(
                color: KColorBlack,
                fontSize: 12.sp,
                fontWeight: FontWeight.bold,
              ),
        ),
      ),
    ],
  );
}
