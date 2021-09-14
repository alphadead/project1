import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

Widget playerJoinedTeam() {
  return SizedBox(
    height: 150.h,
    child: ListView(
      scrollDirection: Axis.horizontal,
      children: [
        Card(
          color: Colors.amber,
          margin: EdgeInsets.only(top: 10.h),
          elevation: 4,
          child: Padding(
            padding: EdgeInsets.only(left: 18.w, right: 18.w),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Padding(
                  padding: EdgeInsets.only(top: 8.0),
                  child: CircleAvatar(
                    radius: 25,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text("Badgers"),
                ),
              ],
            ),
          ),
        )
      ],
    ),
  );
}
