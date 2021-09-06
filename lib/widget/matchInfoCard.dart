import 'package:flutter/material.dart';
import 'package:vamos/ui/utils/color.dart';
import 'package:vamos/ui/utils/theme.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:vamos/widget/teamWidgets/teamInfoCircularCard.dart';

class MatchInfoCard extends StatelessWidget {
  const MatchInfoCard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.only(bottom: 30.h),
      elevation: 8,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(
            bottom: Radius.circular(0), top: Radius.circular(12.5.sp)),
      ),
      child: Container(
        width: 300.w,
        height: 170.h,
        //color: Colors.red,
        child: Column(
          children: [
            Container(
              height: 140.h,
              padding: EdgeInsets.symmetric(vertical: 10.h),
              child: Column(
                //mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      TeamInfoCircularCard(
                        title: "TeamA",
                        image: "assets/images/placeholder_team_icon.png",
                      ),
                      Text(
                        "Vs",
                        style: themeData().textTheme.headline4!.copyWith(
                              fontSize: 18.1.sp,
                              color: Colors.black,
                            ),
                      ),
                      TeamInfoCircularCard(
                        title: "Team B",
                        image: "assets/images/placeholder_team_icon.png",
                      ),
                    ],
                  ),
                  Container(
                    width: 150.w,
                    child: Text(
                      "Tournament live Streaming Old Trafford, United Kingdom.",
                      textAlign: TextAlign.center,
                      style: themeData().textTheme.headline1!.copyWith(
                          color: KGreyTextUpcomingmatches,
                          fontSize: 10.sp,
                          fontWeight: FontWeight.w400),
                    ),
                  )
                ],
              ),
            ),
            Container(
              height: 30.h,
              width: 300.w,
              color: KBlueContainerUpcomingmatches,
              child: Center(
                child: Text(
                  "Tap on the team for more information of team",
                  style: themeData()
                      .textTheme
                      .headline3!
                      .copyWith(fontSize: 10.5.sp),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
