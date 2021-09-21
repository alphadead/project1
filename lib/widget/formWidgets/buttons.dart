import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:vamos/ui/utils/color.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

Widget primaryActionButtonKRed(void Function() onTap, bool enabled, String text) {
  return GestureDetector(
    onTap: onTap,
    child: Container(
      height: 30.h,
      width: 110.h,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(5),
          color: enabled ? KRed : KRed.withOpacity(0.4)),
      child: Center(
        child: Text(
          text,
          style: TextStyle(color: titleText, fontSize: 11.sp),
        ),
      ),
    ),
  );
}

Widget homeFABBottomNav() {
  return Container(
          width: 60.w,
          child: FittedBox(
            child: FloatingActionButton(
              elevation: 0,
              onPressed: () {
                Get.toNamed('/searchBy');
              },
              backgroundColor: KRed,
              child: SizedBox(
                height: 30,
                child: Image.asset(
                  "assets/images/FloatingActionButton.png",
                  // scale: 30,
                ),
              ),
            ),
          ),
        );
}
