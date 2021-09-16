import 'package:flutter/material.dart';
import 'package:vamos/ui/utils/color.dart';
import 'package:vamos/ui/utils/theme.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

void matchDetailsDialog(
    {required BuildContext context,
    required String groundName,
    required String matchName,
    required String groundLocation,
    required String bookingFee,
    required Function() onAccept,
    required Function() onReject,
    required String acceptText,
    required String rejectText}) {
  Get.defaultDialog<void>(
      title: "",
      content: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.only(left: 25.w, right: 17.w),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              detailsDescription(name: "Match Name", value: matchName),
              detailsDescription(name: "Ground Name", value: groundName),
              detailsDescription(
                  name: 'Ground Location', value: groundLocation),
              detailsDescription(name: "Booking Fee", value: bookingFee),
              SizedBox(height: 10.h),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  GestureDetector(
                    onTap: onAccept,
                    child: Container(
                      margin: EdgeInsets.only(right: 10),
                      //width: 40.w,
                      height: 25.h,
                      decoration: BoxDecoration(
                        color: containerGreen,
                        borderRadius: BorderRadius.circular(2.5.w),
                      ),
                      child: Center(
                          child: Padding(
                        padding: EdgeInsets.only(left: 5.0.w, right: 5.w),
                        child: Text(
                          acceptText,
                          style: themeData().textTheme.bodyText1!.copyWith(
                                color: Colors.white,
                                fontSize: 12.sp,
                                fontWeight: FontWeight.bold,
                              ),
                        ),
                      )),
                    ),
                  ),
                  GestureDetector(
                    onTap: onReject,
                    child: Container(
                      //  width: 40.w,
                      height: 25.h,
                      decoration: BoxDecoration(
                        color: KRed,
                        borderRadius: BorderRadius.circular(2.5.w),
                      ),
                      child: Center(
                          child: Padding(
                        padding: EdgeInsets.only(left: 5.w, right: 5.w),
                        child: Text(
                          rejectText,
                          style: themeData().textTheme.bodyText1!.copyWith(
                                color: Colors.white,
                                fontSize: 12.sp,
                                fontWeight: FontWeight.bold,
                              ),
                        ),
                      )),
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 10.h,
              ),
            ],
          ),
        ),
      ),
      barrierDismissible: false);
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
