import 'package:date_picker_timeline/date_picker_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_connect/http/src/utils/utils.dart';
import 'package:intl/intl.dart' as intl;
import 'package:shared_preferences/shared_preferences.dart';
import 'package:vamos/core/models/groundProfileView.dart';
import 'package:vamos/core/service/controller/authController.dart';
import 'package:vamos/core/service/controller/groundController.dart';
import 'package:vamos/ui/utils/color.dart';
import 'package:vamos/ui/utils/loginbkground.dart';
import 'package:vamos/ui/utils/theme.dart';
import 'package:vamos/widget/buttons.dart';
import 'package:vamos/widget/customAppBar.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:vamos/widget/customBottomNavBar.dart';
import 'package:vamos/widget/dateSchedulePopup.dart';
import 'package:vamos/widget/groundScheduleWidget.dart';

List schedule = [
  ["Team Invitation", "10:20"],
  ["FIFA World Cup", "12:22"],
];

List<String> months = [
  'January',
  'February',
  'March',
  'April',
  'May',
  'June',
  'July',
  'August',
  'September',
  'October',
  'November',
  'December'
];

class ViewGroundScreen extends StatefulWidget {
  const ViewGroundScreen({Key? key}) : super(key: key);

  @override
  _ViewGroundScreenState createState() => _ViewGroundScreenState();
}

class _ViewGroundScreenState extends State<ViewGroundScreen> {
  @override
  void initState() {
    WidgetsBinding.instance!.addPostFrameCallback((_) {
      Get.find<GroundController>().getProfileData();
    });
    super.initState();
  }

  bool isVisible = false;
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
                                        _groundService.groundName.toString(),
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
                                      "Booking Fees: \$${_groundService.bookingFees}",
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
                        text: schedule[index][0],
                        time: schedule[index][1],
                      );
                    },
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      FloatingActionButton(
                        backgroundColor: containerGreen,
                        child: Image.asset(
                          "assets/images/pencil.png",
                          scale: 3.5,
                        ),
                        onPressed: () {},
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  primaryActionButton(
                      context: context,
                      onPressed: () async {
                        SharedPreferences prefs =
                            await SharedPreferences.getInstance();
                        prefs.clear();
                        Get.offAllNamed("/login");
                      },
                      text: "Logout"),
                  SizedBox(
                    height: 40,
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

class CustomCalender extends StatefulWidget {
  const CustomCalender(
      {Key? key,
      required this.isVisibleControllerTrue,
      required this.isVisibleControllerFalse})
      : super(key: key);
  final Function isVisibleControllerTrue;
  final Function isVisibleControllerFalse;
  @override
  _CustomCalenderState createState() => _CustomCalenderState();
}

class _CustomCalenderState extends State<CustomCalender> {
  String dropdownValue = months[DateTime.now().month - 1];
  int calenderStartingDate = DateTime.now().day;
  int? selectedIndex;
  @override
  Widget build(BuildContext context) {
    return GetBuilder<GroundController>(
      builder: (_groundService) {
        return Card(
          child: Container(
            height: 130.h,
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.fromLTRB(12, 8, 15, 5),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "Calendar",
                        style: themeData().textTheme.bodyText1!.copyWith(
                              color: profileContainerColor,
                              fontSize: 13.sp,
                              fontWeight: FontWeight.bold,
                            ),
                      ),
                      DropdownButton<String>(
                        value: dropdownValue,
                        icon: const Icon(
                          Icons.arrow_drop_down,
                          color: KRed,
                        ),
                        iconSize: 24,
                        elevation: 16,
                        style: themeData().textTheme.bodyText1!.copyWith(
                              color: profileContainerColor,
                              fontSize: 13.sp,
                              fontWeight: FontWeight.bold,
                            ),
                        underline: Container(
                          height: 0,
                        ),
                        onChanged: (String? newValue) {
                          setState(() {
                            dropdownValue = newValue!;
                            selectedIndex = null;
                            _groundService.selectedDate = null;
                            if (months.indexOf(dropdownValue) + 1 ==
                                DateTime.now().month) {
                              calenderStartingDate = DateTime.now().day;
                            } else {
                              calenderStartingDate = 1;
                            }
                            widget.isVisibleControllerFalse();
                          });
                        },
                        items: <String>[
                          months[DateTime.now().month - 1],
                          months[DateTime.now().month]
                        ].map<DropdownMenuItem<String>>((String val) {
                          return DropdownMenuItem<String>(
                            value: val,
                            child: Text(val),
                          );
                        }).toList(),
                      )
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 8),
                  child: Container(
                    height: 65,
                    child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemCount: DateTime(DateTime.now().year,
                                  months.indexOf(dropdownValue) + 1, 0)
                              .day -
                          calenderStartingDate +
                          1,
                      itemBuilder: (context, index) {
                        DateTime thisDate = DateTime(
                          DateTime.now().year,
                          months.indexOf(dropdownValue) + 1,
                          index + calenderStartingDate,
                        );
                        bool isScheduled =
                            _groundService.checkIsScheduled(thisDate);
                        bool isSelected = selectedIndex == index;
                        return Stack(
                          children: [
                            isScheduled
                                ? Positioned(
                                    right: 0,
                                    top: 0,
                                    child: Stack(
                                      alignment: Alignment.center,
                                      children: [
                                        Container(
                                          width: 19,
                                          height: 19,
                                          decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(11.5),
                                            color: Colors.white,
                                          ),
                                        ),
                                        Icon(
                                          Icons.check_circle_rounded,
                                          size: 23,
                                          color: containerGreen,
                                        ),
                                      ],
                                    ),
                                  )
                                : SizedBox(),
                            Container(
                              margin: EdgeInsets.symmetric(
                                  vertical: 5, horizontal: 3),
                              child: Ink(
                                width: 45.w,
                                decoration: BoxDecoration(
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(8.0)),
                                    color: isSelected ? KRed : Colors.white,
                                    border: isSelected
                                        ? Border.all(color: Colors.white)
                                        : Border.all(color: Colors.black26)),
                                child: InkWell(
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(8.0)),
                                  onTap: () {
                                    setState(() {
                                      selectedIndex = index;
                                      isSelected = true;
                                      isScheduled
                                          ? widget.isVisibleControllerTrue()
                                          : widget.isVisibleControllerFalse();
                                    });
                                    _groundService.selectedDate = thisDate;
                                    !isScheduled
                                        ? showDialog(
                                            context: context,
                                            barrierDismissible: false,
                                            builder: (BuildContext context) {
                                              return ScheduleCard(
                                                groundName: false,
                                                scheduleDate: DateTime(
                                                    DateTime.now().year,
                                                    months.indexOf(
                                                            dropdownValue) +
                                                        1,
                                                    index +
                                                        calenderStartingDate),
                                              );
                                            },
                                          )
                                        : print("");
                                  },
                                  child: Padding(
                                    padding: EdgeInsets.all(8),
                                    child: Center(
                                      child: Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.end,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.center,
                                        children: [
                                          Text(
                                            "${intl.DateFormat('EEEE').format(DateTime(DateTime.now().year, months.indexOf(dropdownValue) + 1, index + calenderStartingDate)).substring(0, 3)}",
                                            style: themeData()
                                                .textTheme
                                                .bodyText1!
                                                .copyWith(
                                                    fontSize: 10,
                                                    fontWeight: FontWeight.bold,
                                                    color: isSelected
                                                        ? Colors.white
                                                        : Colors.black),
                                          ),
                                          Text(
                                            "${index + calenderStartingDate}",
                                            style: themeData()
                                                .textTheme
                                                .bodyText1!
                                                .copyWith(
                                                    fontSize: 15,
                                                    fontWeight: FontWeight.bold,
                                                    color: isSelected
                                                        ? Colors.white
                                                        : Colors.black),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        );
                      },
                    ),
                  ),
                )
              ],
            ),
          ),
        );
      },
    );
  }
}
