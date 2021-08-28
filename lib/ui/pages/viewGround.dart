import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:vamos/core/service/controller/authController.dart';
import 'package:vamos/ui/utils/color.dart';
import 'package:vamos/ui/utils/theme.dart';
import 'package:vamos/widget/buttons.dart';
import 'package:vamos/widget/customAppBar.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:vamos/widget/customBottomNavBar.dart';
import 'package:vamos/widget/groundScheduleWidget.dart';

List schedule = [
  ["Team Invitation", "10:20"],
  ["FIFA World Cup", "12:22"],
];

class ViewGroundScreen extends StatelessWidget {
  const ViewGroundScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: GetBuilder<AuthController>(
        builder: (_authService) => Directionality(
          textDirection: TextDirection.ltr,
          child: Scaffold(
            appBar: PreferredSize(
              preferredSize: Size.fromHeight(60.h),
              child: CustomAppBar(),
            ),
            floatingActionButton: homeFABBottomNav(),
            floatingActionButtonLocation:
                FloatingActionButtonLocation.miniCenterDocked,
            bottomNavigationBar: CustomBottomAppBar(
              height: 50.h,
            ),
            body: SingleChildScrollView(
              padding: EdgeInsets.symmetric(horizontal: 30.w),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Container(
                    width: double.infinity,
                    margin: EdgeInsets.only(top: 20.h),
                  ),
                  Container(
                    margin: EdgeInsets.only(bottom: 10.h),
                    height: 56.h,
                    child: Image.asset("assets/images/stadium.webp"),
                  ),
                  Text(
                    "Ground Profile",
                    style: themeData().textTheme.bodyText1!.copyWith(
                          color: profileContainerColor,
                          fontSize: 15.sp,
                          fontWeight: FontWeight.bold,
                        ),
                  ),
                  Card(
                    margin: EdgeInsets.only(top: 16.h),
                    child: Container(
                      width: 300.w,
                      height: 180.h,
                      margin: EdgeInsets.all(12.h),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Row(
                            children: [
                              Image.asset(
                                "assets/images/locationPin.webp",
                                height: 35.h,
                              ),
                              Container(
                                margin: EdgeInsets.only(left: 10.w),
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Container(
                                      width: 170.w,
                                      child: Text(
                                        "Michigan Stadium",
                                        maxLines: 2,
                                        overflow: TextOverflow.ellipsis,
                                        style: themeData()
                                            .textTheme
                                            .bodyText1!
                                            .copyWith(
                                                fontSize: 12.sp,
                                                fontWeight: FontWeight.bold,
                                                color: KRed,
                                                height: 1),
                                      ),
                                    ),
                                    Text(
                                      "Booking Fees: \$2500",
                                      style: themeData()
                                          .textTheme
                                          .bodyText1!
                                          .copyWith(
                                              height: 1.25,
                                              fontSize: 9.sp,
                                              fontWeight: FontWeight.w600),
                                    )
                                  ],
                                ),
                              ),
                              Expanded(child: SizedBox()),
                              GestureDetector(
                                onTap: () {},
                                child: Image.asset(
                                  "assets/images/imageIcon.webp",
                                  height: 25.h,
                                ),
                              ),
                            ],
                          ),
                          Container(
                            margin: EdgeInsets.only(top: 12.h),
                            width: 275.w,
                            height: 115.h,
                            decoration: BoxDecoration(
                              image: DecorationImage(
                                fit: BoxFit.fill,
                                image: NetworkImage(
                                  "https://tests4geeks.com/blog/wp-content/uploads/2016/04/Marker.png",
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.symmetric(vertical: 20.h),
                    child: Text(
                      "Availability of Ground",
                      style: themeData().textTheme.bodyText1!.copyWith(
                          fontSize: 12.sp,
                          fontWeight: FontWeight.bold,
                          color: KRed),
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(bottom: 15.h),
                    child: Row(
                      children: [
                        Text(
                          "Schedule",
                          style: themeData().textTheme.bodyText1!.copyWith(
                                color: profileContainerColor,
                                fontSize: 15.sp,
                                fontWeight: FontWeight.bold,
                              ),
                        ),
                      ],
                    ),
                  ),
                  ListView.builder(
                    itemCount: schedule.length,
                    physics: NeverScrollableScrollPhysics(),
                    shrinkWrap: true,
                    itemBuilder: (context, index) {
                      return GroundScheduleWidget(
                          text: schedule[index][0], time: schedule[index][1]);
                    },
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
