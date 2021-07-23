import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:vamos/ui/utils/color.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

Widget registeredTeamContainer(
    {required BuildContext context, required String name}) {
  return Container(
    margin: EdgeInsets.only(bottom: 12),
    child: Ink(
      width: 333.w,
      height: 65.h,
      decoration: BoxDecoration(
        color: containerGreen,
        borderRadius: BorderRadius.circular(2.5),
      ),
      child: Row(
        children: [
          Container(
            margin: EdgeInsets.symmetric(vertical: 5.h, horizontal: 10),
            child: Image.asset('assets/images/placeholder_team_icon.png'),
          ),
          Container(
            padding: EdgeInsets.only(left: 5),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  name,
                  style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.w600,
                    fontSize: 12.sp,
                  ),
                ),
                // Text(
                //   AppLocalizations.of(context)!
                //       .registeredTeamsPage_demoTeamName,
                //   style: TextStyle(
                //     fontWeight: FontWeight.w400,
                //     fontSize: 8.8.sp,
                //   ),
                // ),
              ],
            ),
          ),
          Expanded(child: Container()),
          Container(
            margin: EdgeInsets.only(right: 10),
            child: Ink(
              width: 75.w,
              height: 25.h,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12),
                color: Colors.red,
              ),
              child: InkWell(
                borderRadius: BorderRadius.circular(12),
                onTap: () {},
                child: Center(
                  child: Text(
                    AppLocalizations.of(context)!
                        .registeredTeamsPage_joinButtonText,
                    style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.w900,
                        fontSize: 10.sp),
                  ),
                ),
              ),
            ),
          )
        ],
      ),
    ),
  );
}
