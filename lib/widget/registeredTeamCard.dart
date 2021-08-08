import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:vamos/core/models/teamListingResponse.dart';
import 'package:vamos/ui/utils/color.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:vamos/widget/teamCardButton.dart';

Widget registeredTeamContainer(
    {required BuildContext context,
    TeamData? team,
    required String buttonText,
    required VoidCallback onPressed,
    bool? pressed}) {
  return Container(
    margin: EdgeInsets.only(bottom: 12),
    child: Ink(
      height: 65.h,
      decoration: BoxDecoration(
        color: containerGreen,
        borderRadius: BorderRadius.circular(2.5),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Container(
            margin: EdgeInsets.symmetric(vertical: 5.h, horizontal: 10),
            child: Image.asset('assets/images/placeholder_team_icon.png'),
          ),
          Container(
            width: .4.sw,
            padding: EdgeInsets.only(left: 5),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  team!.name.toString(),
                  style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.w600,
                    fontSize: 12.sp,
                  ),
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                  softWrap: false,
                ),
              ],
            ),
          ),
          Expanded(child: Container()),
          Container(
            margin: EdgeInsets.only(right: 10),
            child: Ink(
                width: 70.w,
                height: 25.h,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12),
                  color: Colors.red,
                ),
                child: TeamButton(
                  id: team.id!,
                  buttonText: buttonText,
                  onPressed: onPressed,
                  pressed: pressed,
                )),
          )
        ],
      ),
    ),
  );
}
