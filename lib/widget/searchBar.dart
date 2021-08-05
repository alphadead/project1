import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:vamos/ui/utils/color.dart';

Widget searchBar({required Function(String) onchanged}) {
  return Container(
    margin: EdgeInsets.only(left: 5.w, right: 5.w),
    decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(20),
      border: Border.all(width: 0.5, color: bgroundCol),
    ),
    child: Padding(
      padding: EdgeInsets.only(left: 10.w),
      child: TextField(
        onChanged: onchanged,
        decoration: InputDecoration(
            hintText: "Search...",
            border: InputBorder.none,
            focusedBorder: InputBorder.none,
            enabledBorder: InputBorder.none,
            suffixIcon: Icon(
              Icons.search,
              color: bgroundCol,
            )),
      ),
    ),
  );
}
