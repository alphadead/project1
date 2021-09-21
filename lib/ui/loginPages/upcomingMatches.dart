import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:vamos/core/service/controller/authController.dart';
import 'package:vamos/core/service/controller/matchController.dart';
import 'package:vamos/ui/utils/color.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:vamos/ui/utils/theme.dart';
import 'package:vamos/widget/formWidgets/buttons.dart';
import 'package:vamos/widget/customAppBar.dart';
import 'package:vamos/widget/customBottomNavBar.dart';
import 'package:vamos/widget/matchInfoCard.dart';
import 'package:vamos/widget/profileContainer.dart';
import 'package:vamos/widget/teamWidgets/teamInfoCircularCard.dart';

class UpcomingMatchesPage extends StatefulWidget {
  const UpcomingMatchesPage({Key? key}) : super(key: key);

  @override
  _UpcomingMatchesPageState createState() => _UpcomingMatchesPageState();
}

class _UpcomingMatchesPageState extends State<UpcomingMatchesPage> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance!.addPostFrameCallback(
        (_) => Get.put(MatchController()).upcomingMatch());
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: GetBuilder<MatchController>(
        builder: (_matchService) => Directionality(
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
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Align(
                    alignment: Alignment.centerLeft,
                    child: Container(
                      margin: EdgeInsets.symmetric(vertical: 30.h),
                      child: ProfileContainer(
                        title: "Upcoming Matches",
                        width: 190.5.w,
                        fontSize: 15.sp,
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(33, 10, 33, 10),
                    child: ListView.builder(
                      shrinkWrap: true,
                      physics: NeverScrollableScrollPhysics(),
                      itemCount: _matchService.upcomingMatchesList?.length ?? 0,
                      itemBuilder: (context, index) {
                        return Card(
                          margin: EdgeInsets.only(bottom: 30.h),
                          elevation: 8,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.vertical(
                                bottom: Radius.circular(0),
                                top: Radius.circular(12.5.sp)),
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
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceEvenly,
                                    children: [
                                      Text(
                                        _matchService
                                                .upcomingMatchesList![index]
                                                .name ??
                                            '',
                                        style: themeData()
                                            .textTheme
                                            .headline4!
                                            .copyWith(
                                              fontSize: 16.sp,
                                              color: Colors.black,
                                            ),
                                      ),
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceEvenly,
                                        children: [
                                          TeamInfoCircularCard(
                                            title:
                                                //  _matchService
                                                //         .upcomingMatchesList![index]
                                                //         .matchTeams![0]
                                                //         .teamName ??
                                                'Team ??',
                                            image:
                                                // _matchService
                                                //         .upcomingMatchesList![index]
                                                //         .matchTeams![0]
                                                //         .teamLogo ??
                                                'assets/images/placeholder_team_icon.png',
                                          ),
                                          Text(
                                            "Vs",
                                            style: themeData()
                                                .textTheme
                                                .headline4!
                                                .copyWith(
                                                  fontSize: 18.1.sp,
                                                  color: Colors.black,
                                                ),
                                          ),
                                          TeamInfoCircularCard(
                                            title:
                                                // _matchService
                                                //         .upcomingMatchesList![index]
                                                //         .matchTeams![1]
                                                //         .teamName ??
                                                'Team ??',
                                            image:
                                                //  _matchService
                                                //         .upcomingMatchesList![index]
                                                //         .matchTeams![1]
                                                //         .teamLogo ??
                                                'assets/images/placeholder_team_icon.png',
                                          ),
                                        ],
                                      ),
                                      Container(
                                        width: 170.w,
                                        child: Text(
                                          "Tournament live Streaming " +
                                              (_matchService
                                                      .upcomingMatchesList![
                                                          index]
                                                      .groundName ??
                                                  '') +
                                              ', ' +
                                              (_matchService
                                                      .upcomingMatchesList![
                                                          index]
                                                      .groundName ??
                                                  ''),
                                          textAlign: TextAlign.center,
                                          style: themeData()
                                              .textTheme
                                              .headline1!
                                              .copyWith(
                                                  color:
                                                      KGreyTextUpcomingmatches,
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
                      },
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
