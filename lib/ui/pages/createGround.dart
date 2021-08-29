import 'package:date_picker_timeline/date_picker_timeline.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:multi_image_picker2/multi_image_picker2.dart';
import 'package:vamos/core/service/controller/authController.dart';
import 'package:vamos/ui/utils/color.dart';
import 'package:vamos/ui/utils/theme.dart';
import 'package:vamos/widget/buttons.dart';
import 'package:vamos/widget/customAppBar.dart';
import 'package:vamos/widget/customBottomNavBar.dart';
import 'package:vamos/widget/inputField.dart';

List schedule = [
  ["Team Invitation", "10:20"],
  ["FIFA World Cup", "12:22"],
];

class CreateGround extends StatelessWidget {
  const CreateGround({Key? key}) : super(key: key);

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
                mainAxisAlignment: MainAxisAlignment.start,
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
                  inputField("Ground Name", (value) {}, validate: (arg) {
                    // arg = _authService.teamName;
                    // if (ValidateFeild().isValidateName(arg)) {
                    //   return null;
                    // } else {
                    //   return "Enter valid name";
                    // }
                  }, keyType: TextInputType.name),
                  inputField("Ground Location", (value) {}, validate: (arg) {
                    // arg = _authService.teamName;
                    // if (ValidateFeild().isValidateName(arg)) {
                    //   return null;
                    // } else {
                    //   return "Enter valid name";
                    // }
                  }, keyType: TextInputType.name),
                  Container(
                    margin: EdgeInsets.only(bottom: 12.h, top: 15.h),
                    child: Row(
                      children: [
                        Text(
                          "Ground Pictures and Videos",
                          style: themeData().textTheme.bodyText1!.copyWith(
                                color: profileContainerColor,
                                fontSize: 15.sp,
                                fontWeight: FontWeight.bold,
                              ),
                        ),
                      ],
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      _authService.loadAssets(isSingleImage: true);
                    },
                    child: Container(
                      height: 100.h,
                      width: 300.w,
                      color: KLightGrey.withOpacity(0.2),
                      child: Center(
                        child: _authService.teamLogo.isEmpty
                            ? Image.asset(
                                "assets/images/add_image_1.webp",
                                height: 28.h,
                                width: 34.w,
                              )
                            : AssetThumb(
                                asset: _authService.teamLogo[0],
                                width: 130,
                                height: 130),
                      ),
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(bottom: 5.h, top: 15.h),
                    child: Row(
                      children: [
                        Text(
                          "Ground Availability",
                          style: themeData().textTheme.bodyText1!.copyWith(
                                color: profileContainerColor,
                                fontSize: 15.sp,
                                fontWeight: FontWeight.bold,
                              ),
                        ),
                      ],
                    ),
                  ),
                  Card(
                    child: Container(
                      height: 115.h,
                      child: Column(
                        children: [
                          Padding(
                            padding: const EdgeInsets.fromLTRB(12, 8, 12, 5),
                            child: Row(
                              children: [
                                Text(
                                  "Calendar",
                                  style:
                                      themeData().textTheme.bodyText1!.copyWith(
                                            color: profileContainerColor,
                                            fontSize: 13.sp,
                                            fontWeight: FontWeight.bold,
                                          ),
                                ),
                              ],
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 8),
                            child: Container(
                              child: DatePicker(
                                DateTime.now(),
                                width: 60.w,
                                height: 80.h,
                                initialSelectedDate: DateTime.now(),
                                selectionColor: KRed,
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(bottom: 15.h, top: 10.h),
                    child: Row(
                      children: [
                        Text(
                          "Booking Fees",
                          style: themeData().textTheme.bodyText1!.copyWith(
                                color: profileContainerColor,
                                fontSize: 15.sp,
                                fontWeight: FontWeight.bold,
                              ),
                        ),
                        SizedBox(
                          width: 10.w,
                        ),
                        Container(
                          height: 35.h,
                          width: 100.w,
                          color: KLightGrey.withOpacity(0.2),
                          child: Center(
                              child: Text(
                            "1200\$",
                            style: themeData().textTheme.bodyText1!.copyWith(
                                  color: KColorBlack,
                                  fontSize: 15.sp,
                                  fontWeight: FontWeight.bold,
                                ),
                          )),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 10.h,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      GestureDetector(
                        onTap: () {},
                        child: Container(
                          width: 120.h,
                          height: 40.w,
                          child: Center(
                            child: Text(
                              'Cancel',
                              style: TextStyle(
                                fontSize: 15.sp,
                                fontWeight: FontWeight.bold,
                                color: Colors.white,
                              ),
                            ),
                          ),
                          decoration: BoxDecoration(
                            color: moneyBox,
                            borderRadius: BorderRadius.circular(30),
                          ),
                        ),
                      ),
                      SizedBox(
                        width: 10.w,
                      ),
                      GestureDetector(
                        onTap: () {},
                        child: Container(
                          width: 120.h,
                          height: 40.w,
                          child: Center(
                            child: Text(
                              'Save',
                              style: TextStyle(
                                fontSize: 15.sp,
                                fontWeight: FontWeight.bold,
                                color: Colors.white,
                              ),
                            ),
                          ),
                          decoration: BoxDecoration(
                            color: KRed,
                            borderRadius: BorderRadius.circular(30),
                          ),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 35.h,
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
