import 'package:flutter/material.dart';
import 'package:vamos/ui/utils/color.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ProfileContainer extends StatelessWidget {
  final String? title;
  final double? height;
  final double? width;
  final double? fontSize;
  const ProfileContainer({this.title, this.height, this.width, this.fontSize});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width ?? 150.w,
      height: height ?? 40.h,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.only(
              topRight: Radius.circular(20), bottomRight: Radius.circular(20)),
          color: profileContainerColor),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            padding: EdgeInsets.only(left: 20.w),
            child: Text(
              title.toString(),
              style:
                  TextStyle(color: Colors.white, fontSize: fontSize ?? 17.5.sp),
            ),
          ),
        ],
      ),
    );
  }
}
