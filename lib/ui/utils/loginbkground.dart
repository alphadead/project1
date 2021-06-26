import 'package:flutter/material.dart';
import 'package:vamos/ui/utils/color.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

Widget backgroundContainer() {
  return Positioned(
    width: 600.w,
    height: 200.h,
    bottom: 50.h,
    child: Transform.rotate(
      angle: 5.9,
      origin: Offset(-150.w, 120.h),
      child: Container(
        decoration: BoxDecoration(
          color: bgroundCol,
          borderRadius: BorderRadius.circular(40),
        ),
      ),
    ),
  );
}

Widget buttonLogin(context, Function pages) {
  return GestureDetector(
    onTap: () {
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => pages(),
        ),
      );
    },
    child: Container(
      width: 250.h,
      height: 40.w,
      child: Center(
        child: Text(
          'Continue',
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 15,
            color: Colors.white,
          ),
        ),
      ),
      decoration: BoxDecoration(
        color: Color.fromRGBO(239, 77, 35, 1),
        //(#ef4d23),
        borderRadius: BorderRadius.circular(30),
      ),
    ),
  );
}
