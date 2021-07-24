import 'package:flutter/material.dart';
import 'package:vamos/ui/utils/color.dart';
import 'package:vamos/ui/utils/theme.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class TeamInfoCircularCard extends StatelessWidget {
  final String? title;
  final String? image;
  const TeamInfoCircularCard({Key? key, this.image, this.title})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Card(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(25),
          ),
          child: Container(
            height: 50,
            width: 50,
            child: Image.asset(image.toString()),
          ),
        ),
        Text(
          title.toString(),
          style: themeData()
              .textTheme
              .headline4!
              .copyWith(color: KRed, fontSize: 10.sp),
        )
      ],
    );
  }
}

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
                          color: Color(0xff939090),
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
              color: Color(0xff044660),
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
