import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class LoginPageStack extends StatelessWidget {
  final heading;
  final imageWidget;
  LoginPageStack({this.heading, this.imageWidget});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        border: Border.all(width: 0, color: Colors.white),
      ),
      margin: EdgeInsets.only(bottom: 10),
      height: 250.h,
      child: Stack(
        alignment: AlignmentDirectional.bottomEnd,
        fit: StackFit.expand,
        children: [
          Positioned(
            left: -100.w,
            child: Image.asset(
              "assets/images/rectangle_1.webp",
              width: 1.50.sw,
              fit: BoxFit.fitWidth,
            ),
          ),
          imageWidget,
          Positioned(
            top: 160.0.h,
            left: 40.0.w,
            child: Container(
              width: 150.w,
              child: Text(
                heading,
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 20.sp,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
