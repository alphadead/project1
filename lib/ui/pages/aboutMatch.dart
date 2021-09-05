import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:vamos/core/models/groundList.dart';
import 'package:vamos/core/service/controller/addsController.dart';
import 'package:vamos/core/service/controller/myTeamController.dart';
import 'package:vamos/core/service/controller/teamListingController.dart';
import 'package:vamos/ui/utils/color.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:vamos/ui/utils/theme.dart';
import 'package:vamos/widget/addsOptionsContainer.dart';
import 'package:vamos/widget/buttons.dart';
import 'package:vamos/widget/customAppBar.dart';
import 'package:vamos/widget/customBottomNavBar.dart';
import 'package:vamos/widget/inputField.dart';

class AboutMatch extends StatefulWidget {
  const AboutMatch({Key? key}) : super(key: key);

  @override
  _AboutMatchState createState() => _AboutMatchState();
}

class _AboutMatchState extends State<AboutMatch> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance!.addPostFrameCallback(
        (_) => Get.find<TeamListController>().getGroundlist());
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: GetBuilder<AddsController>(
        builder: (_addService) => Directionality(
          textDirection: TextDirection.ltr,
          child: Scaffold(
            floatingActionButtonLocation:
                FloatingActionButtonLocation.miniCenterDocked,
            floatingActionButton: homeFABBottomNav(),
            bottomNavigationBar: CustomBottomAppBar(
              height: 50.h,
            ),
            appBar: PreferredSize(
              preferredSize: Size.fromHeight(60.h),
              child: CustomAppBar(),
            ),
            body: SingleChildScrollView(
              child: Column(
                children: [
                  CarouselSlider(
                    items: _addService.listAdds
                        .map((item) => Container(
                              child: Center(child: item),
                            ))
                        .toList(),
                    options: CarouselOptions(
                        scrollDirection: Axis.horizontal, autoPlay: true),
                  ),
                  Container(
                    margin: EdgeInsets.only(bottom: 10.h),
                    height: 56.h,
                    child: Image.asset("assets/images/kick_football.webp"),
                  ),
                  Text(
                    "About Match",
                    style: themeData().textTheme.bodyText1!.copyWith(
                          color: profileContainerColor,
                          fontSize: 18.sp,
                          fontWeight: FontWeight.bold,
                        ),
                  ),
                  SingleChildScrollView(
                    padding: EdgeInsets.symmetric(horizontal: 30.w),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Container(
                          margin: EdgeInsets.only(bottom: 5.h, top: 15.h),
                          child: Row(
                            children: [
                              Text(
                                "Team detail",
                                style:
                                    themeData().textTheme.bodyText1!.copyWith(
                                          color: profileContainerColor,
                                          fontSize: 15.sp,
                                          fontWeight: FontWeight.bold,
                                        ),
                              ),
                            ],
                          ),
                        ),
                        Card(
                          child: GetBuilder<MyTeamController>(
                            builder: (_myTeamInfo) => Container(
                              child: Row(
                                children: [
                                  Container(
                                    height: 54.h,
                                    margin: EdgeInsets.symmetric(
                                        vertical: 5.h, horizontal: 15),
                                    child: CircleAvatar(
                                      radius: 20.h,
                                      backgroundImage:
                                          _myTeamInfo.teamInfo?.logo == null ||
                                                  _myTeamInfo.teamInfo?.logo ==
                                                      ''
                                              ? NetworkImage('')
                                              : NetworkImage(_myTeamInfo
                                                      .teamInfo?.logo
                                                      .toString() ??
                                                  ""),
                                    ),
                                  ),
                                  Expanded(
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          _myTeamInfo.teamInfo?.name
                                                  .toString() ??
                                              "",
                                          style: themeData()
                                              .textTheme
                                              .bodyText1!
                                              .copyWith(
                                                fontSize: 15.sp,
                                                fontWeight: FontWeight.bold,
                                                color: KRed,
                                              ),
                                        ),
                                        Text(
                                          (_myTeamInfo.teamInfo?.teamSize
                                                      .toString() ??
                                                  "") +
                                              'x' +
                                              (_myTeamInfo.teamInfo?.teamSize
                                                      .toString() ??
                                                  "") +
                                              ' Team',
                                          style: themeData()
                                              .textTheme
                                              .bodyText1!
                                              .copyWith(
                                                fontSize: 10.sp,
                                              ),
                                        )
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                        inputField("Match name", (value) {}, validate: (arg) {
                          // arg = _authService.teamName;
                          // if (ValidateFeild().isValidateName(arg)) {
                          //   return null;
                          // } else {
                          //   return "Enter valid name";
                          // }
                        }, keyType: TextInputType.name),
                        GetBuilder<TeamListController>(
                          builder: (_myTeamInfo) {
                            var item = List.generate(
                              _myTeamInfo.groundList.length,
                              (index) =>
                                  _myTeamInfo.groundList[index].name.toString(),
                            );

                            print('+++++++++++++++++++++');
                            print(item);
                            print('+++++++++++++++++++++');
                            return Padding(
                              padding:
                                  const EdgeInsets.symmetric(vertical: 8.0),
                              child: DropdownButtonFormField(
                                  isExpanded: true,
                                  elevation: 25,
                                  hint: Text(
                                    'Ground name',
                                    style: TextStyle(color: KLightGrey),
                                  ),
                                  items: List.generate(
                                    _myTeamInfo.groundList.length,
                                    (index) => DropdownMenuItem<String>(
                                      value: _myTeamInfo.groundList[index].name
                                          .toString(),
                                      child: Text(
                                        _myTeamInfo.groundList[index].name
                                            .toString(),
                                        style: TextStyle(
                                            color: inputText, fontSize: 16),
                                      ),
                                    ),
                                  )
                                  // .map(
                                  //   (e) => DropdownMenuItem<String>(
                                  //     value: _myTeamInfo
                                  //         .groundList[int.parse(e)].name
                                  //         .toString(),
                                  //     child: Text(
                                  //       _myTeamInfo
                                  //           .groundList[int.parse(e)].name
                                  //           .toString(),
                                  //       style: TextStyle(
                                  //           color: inputText, fontSize: 16),
                                  //     ),
                                  //   ),
                                  // )
                                  // .toList(),
                                  ),
                            );
                          },
                        ),
                        Container(
                          margin: EdgeInsets.only(bottom: 5.h, top: 5.h),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              Text(
                                "Add New +",
                                style:
                                    themeData().textTheme.bodyText1!.copyWith(
                                          color: KRed,
                                          fontSize: 15.sp,
                                          fontWeight: FontWeight.bold,
                                        ),
                              ),
                            ],
                          ),
                        ),
                        Container(
                          margin: EdgeInsets.only(bottom: 5.h, top: 15.h),
                          child: Row(
                            children: [
                              Text(
                                "Ground Availability",
                                style:
                                    themeData().textTheme.bodyText1!.copyWith(
                                          color: profileContainerColor,
                                          fontSize: 15.sp,
                                          fontWeight: FontWeight.bold,
                                        ),
                              ),
                            ],
                          ),
                        ),
                        Container(
                          margin: EdgeInsets.only(bottom: 15.h, top: 10.h),
                          child: Row(
                            children: [
                              Text(
                                "Booking Fees",
                                style:
                                    themeData().textTheme.bodyText1!.copyWith(
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
                                    child: TextField(
                                  keyboardType: TextInputType.number,
                                  textAlign: TextAlign.center,
                                  style:
                                      themeData().textTheme.bodyText1!.copyWith(
                                            color: KColorBlack,
                                            fontSize: 15.sp,
                                            fontWeight: FontWeight.bold,
                                          ),
                                  onChanged: (value) {
                                    // _groundService.bookingFee = value;
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
                                    'Invite team',
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
                                //_groundService.groundUpdate();
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
                        )
                      ],
                    ),
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
