import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:vamos/core/service/controller/myTeamController.dart';
import 'package:vamos/ui/utils/color.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:vamos/ui/utils/theme.dart';
import 'package:vamos/ui/utils/utility.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

Widget logoContainer(BuildContext context, String image, String logoName,
    {String nextRoute = "/createTeam"}) {
  return Stack(children: [
    Positioned(
      child: InkWell(
        onTap: () async {
          if (nextRoute == "/createTeam") {
            WidgetsBinding.instance!.addPostFrameCallback((_) {
              Get.put(MyTeamController()).getTeamInfo(nextRoute: "/createTeam");
            });
          } else {
            Get.toNamed(nextRoute);
          }
        },
        child: Container(
          height: 110.h,
          width: 160.w,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(3),
            border: Border.all(color: borderCol),
          ),
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Image.asset(
                  image,
                  height: 65.h,
                ),
                SizedBox(
                  height: 28.h,
                ),
              ],
            ),
          ),
        ),
      ),
    ),
    Positioned(
      top: 98.h,
      left: 10.w,
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(3),
          color: logoNamebackground,
        ),
        width: 140.w,
        height: 30.h,
        child: Center(
          child: Text(
            logoName,
            style: themeData().textTheme.headline2,
          ),
        ),
      ),
    )
  ]);
}
