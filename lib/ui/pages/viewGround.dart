import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:vamos/core/service/controller/groundController.dart';
import 'package:vamos/ui/utils/color.dart';
import 'package:vamos/ui/utils/loginbkground.dart';
import 'package:vamos/ui/utils/theme.dart';
import 'package:vamos/widget/formWidgets/buttons.dart';
import 'package:vamos/widget/customAppBar.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:vamos/widget/customBottomNavBar.dart';
import 'package:vamos/widget/dateSchedulePopup.dart';
import 'package:vamos/widget/groundScheduleWidget.dart';
import 'package:vamos/widget/groundWidgets/customCalendar.dart';

List schedule = [
  ["Team Invitation", "10:20"],
  ["FIFA World Cup", "12:22"],
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
            body: Stack(
              children: [
                SingleChildScrollView(
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
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Container(
                                          width: 170.w,
                                          child: Text(
                                            _groundService.groundName
                                                .toString(),
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
                                    image: CachedNetworkImageProvider(
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
                            isVisible = false;
                          });
                        },
                        isVisibleControllerFalse: () {
                          setState(() {
                            isVisible = false;
                          });
                        },
                        viewGroundProfile: true,
                      ),
                      Container(
                        margin:
                            EdgeInsets.symmetric(vertical: 10, horizontal: 5),
                        // height: 50,
                        child: isVisible
                            ? Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
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
                                            isEdit: true,
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
                        itemCount: _groundService.availableDates.length,
                        physics: NeverScrollableScrollPhysics(),
                        shrinkWrap: true,
                        itemBuilder: (context, index) {
                          return GroundScheduleWidget(
                            text: _groundService.availableDates[index]
                                    ['date'] ??
                                "No Date Available",
                            opentime: _groundService.availableDates[index]
                                    ['opening_time'] ??
                                "NA",
                            closeTime: _groundService.availableDates[index]
                                    ['closing_time'] ??
                                "NA",
                          );
                        },
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
                Align(
                  alignment: Alignment.bottomRight,
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: FloatingActionButton(
                      heroTag: null,
                      backgroundColor: containerGreen,
                      child: Image.asset(
                        "assets/images/pencil.png",
                        scale: 3.5,
                      ),
                      onPressed: () {
                        Get.toNamed("/createGroundScreen", arguments: true);
                      },
                    ),
                  ),
                ),
              ],
            ),
          ),
        );
      }),
    );
  }
}
