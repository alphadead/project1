import 'package:flutter/material.dart';
import 'package:vamos/ui/utils/color.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

Widget backgroundContainer() {
  return Positioned(
    //top: -20,
    left: -70.w,
    child: Image.asset(
      "assets/images/rectangle_1.webp",
      width: 1.25.sw,
      fit: BoxFit.fitWidth,
    ),
  );
}

Widget primaryActionButton(
    {required BuildContext context,
    required Function()? onPressed,
    String text = 'continue'}) {
  return GestureDetector(
    onTap: onPressed,
    child: Container(
      width: 250.h,
      height: 40.w,
      child: Center(
        child: Text(
          text,
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
