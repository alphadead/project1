import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:vamos/core/service/controller/groundController.dart';
import 'package:vamos/ui/utils/color.dart';
import 'package:vamos/ui/utils/loginbkground.dart';
import 'package:vamos/ui/utils/theme.dart';
import 'package:vamos/widget/customAppBar.dart';
import 'package:vamos/widget/dateSchedulePopup.dart';
import 'package:vamos/widget/groundWidgets/customCalendar.dart';
import 'package:vamos/widget/formWidgets/inputField.dart';

List schedule = [
  ["Team Invitation", "10:20"],
  ["FIFA World Cup", "12:22"],
];

class CreateGround extends StatefulWidget {
  const CreateGround({Key? key}) : super(key: key);

  @override
  _CreateGroundState createState() => _CreateGroundState();
}

String dropdownValue = 'January';
TextEditingController feesController = TextEditingController();

class _CreateGroundState extends State<CreateGround> {
  bool isVisible = false;
  bool arguments = false;

  @override
  void initState() {
    WidgetsBinding.instance!.addPostFrameCallback((_) {
      setState(() {
        arguments = Get.arguments;
      });
      if (arguments) {
        Get.find<GroundController>().getProfileData();
      }
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: GetBuilder<GroundController>(builder: (_groundService) {
        return Directionality(
          textDirection: TextDirection.ltr,
          child: Scaffold(
            appBar: PreferredSize(
              preferredSize: Size.fromHeight(60.h),
              child: CustomAppBar(),
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
                  inputField("Ground Name", (value) {
                    _groundService.groundName = value;
                  },
                      validate: (arg) {},
                      initialValue: _groundService.groundName.toString(),
                      keyType: TextInputType.name),
                  inputField("Ground Location", (value) {
                    _groundService.groundLocation = value;
                  },
                      validate: (arg) {},
                      initialValue: _groundService.groundLocation.toString(),
                      keyType: TextInputType.name),
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
                    onTap: () {},
                    child: Container(
                      height: 100.h,
                      width: 300.w,
                      color: KLightGrey.withOpacity(0.2),
                      child: Center(
                          child: Image.asset(
                        "assets/images/add_image_1.webp",
                        height: 28.h,
                        width: 34.w,
                      )),
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
                  CustomCalender(
                    isVisibleControllerTrue: () {
                      setState(() {
                        isVisible = true;
                      });
                    },
                    isVisibleControllerFalse: () {
                      setState(() {
                        isVisible = false;
                      });
                    },
                  ),
                  Container(
                    margin: EdgeInsets.symmetric(vertical: 10, horizontal: 5),
                    height: 50,
                    child: isVisible
                        ? Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              primaryActionButton(
                                text: "Delete",
                                color: moneyBox,
                                width: 100,
                                height: 40,
                                fontSize: 15,
                                context: context,
                                onPressed: () {
                                  _groundService.deleteSchedule();
                                  setState(() {
                                    isVisible = false;
                                  });
                                },
                              ),
                              primaryActionButton(
                                text: "Update",
                                width: 100,
                                height: 40,
                                fontSize: 15,
                                context: context,
                                onPressed: () {
                                  showDialog(
                                    context: context,
                                    barrierDismissible: false,
                                    builder: (BuildContext context) {
                                      return ScheduleCard(
                                        isEdit: false,
                                        groundName: false,
                                        scheduleDate:
                                            _groundService.selectedDate!,
                                      );
                                    },
                                  );
                                  setState(() {
                                    isVisible = false;
                                  });
                                },
                              ),
                            ],
                          )
                        : SizedBox(),
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
                              child: TextFormField(
                            initialValue: _groundService.bookingFees,
                            keyboardType: TextInputType.number,
                            textAlign: TextAlign.center,
                            style: themeData().textTheme.bodyText1!.copyWith(
                                  color: KColorBlack,
                                  fontSize: 15.sp,
                                  fontWeight: FontWeight.bold,
                                ),
                            onChanged: (value) {
                              _groundService.bookingFee = value;
                            },
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
                        onTap: () {
                          Get.toNamed("/homeScreen");
                        },
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
                        onTap: () {
                          _groundService.groundUpdate();
                        },
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
        );
      }),
    );
  }
}
