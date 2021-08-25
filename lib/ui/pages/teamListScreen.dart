import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:provider/single_child_widget.dart';
import 'package:vamos/core/models/joinTeam.dart';
import 'package:vamos/core/service/controller/authController.dart';
import 'package:vamos/core/service/controller/teamListingController.dart';
import 'package:vamos/ui/utils/color.dart';
import 'package:vamos/ui/utils/theme.dart';
import 'package:vamos/ui/utils/utility.dart';
import 'package:vamos/widget/customAppBar.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:vamos/widget/customBottomNavBar.dart';

class TeamListScreen extends StatefulWidget {
  const TeamListScreen({Key? key}) : super(key: key);

  @override
  _TeamListScreenState createState() => _TeamListScreenState();
}

class _TeamListScreenState extends State<TeamListScreen> {
  @override
  Widget build(BuildContext context) {
    List<Color> teamListColor = [moneyBox, containerGreen, KRed];

    String buttonMsg;
    Color buttonCol;

    return SafeArea(
      child: GetBuilder<TeamListController>(
        builder: (_teamService) => Directionality(
          textDirection: TextDirection.ltr,
          child: DefaultTabController(
            length: 2,
            child: Scaffold(
              resizeToAvoidBottomInset: false,
              floatingActionButtonLocation:
                  FloatingActionButtonLocation.miniCenterDocked,
              floatingActionButton: Container(
                width: 60.w,
                child: FittedBox(
                  child: FloatingActionButton(
                    elevation: 0,
                    onPressed: () {},
                    backgroundColor: KRed,
                    child: SizedBox(
                      height: 30,
                      child: Image.asset(
                        "assets/images/FloatingActionButton.png",
                        // scale: 30,
                      ),
                    ),
                  ),
                ),
              ),
              bottomNavigationBar: CustomBottomAppBar(
                height: 50.h,
              ),
              appBar: PreferredSize(
                preferredSize: Size.fromHeight(100.h),
                child: CustomAppBar(
                  tabBar: const TabBar(
                    tabs: [
                      Tab(
                        icon: Text(
                          "Outgoing Request",
                          style: TextStyle(
                            //color: profileContainerColor,
                            fontSize: 12,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      Tab(
                        icon: Text(
                          "Incoming Request",
                          style: TextStyle(
                            //color: profileContainerColor,
                            fontSize: 12,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              body: TabBarView(
                children: [
                  SingleChildScrollView(
                    child: Column(
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Container(
                              margin: EdgeInsets.symmetric(vertical: 20.h),
                              child: Column(
                                children: [
                                  Container(
                                    margin: EdgeInsets.only(bottom: 10.h),
                                    height: 56.h,
                                    child: Image.asset(
                                        "assets/images/team_logo.webp"),
                                  ),
                                  Text(
                                    "List of Teams",
                                    style: themeData()
                                        .textTheme
                                        .bodyText1!
                                        .copyWith(
                                          color: profileContainerColor,
                                          fontSize: 12.sp,
                                          fontWeight: FontWeight.bold,
                                        ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                        ListView.builder(
                          physics: NeverScrollableScrollPhysics(),
                          shrinkWrap: true,
                          itemCount: _teamService.teamList.length,
                          itemBuilder: (context, index) {
                            buttonMsg =
                                _teamService.teamList[index].status == null
                                    ? "Request"
                                    : "Pending";
                            buttonCol =
                                _teamService.teamList[index].status == null
                                    ? teamListColor[0]
                                    : _teamService.teamList[index].status
                                                .toString() ==
                                            'pending'
                                        ? teamListColor[2]
                                        : teamListColor[1];
                            return Container(
                              margin: EdgeInsets.only(top: 10.h),
                              child: Center(
                                child: Stack(
                                  children: [
                                    Container(
                                      height: 100.h,
                                      width: 300.w,
                                      child: Card(
                                        shape: RoundedRectangleBorder(
                                            borderRadius:
                                                BorderRadius.circular(2.5.w)),
                                        elevation: 3,
                                        margin: EdgeInsets.fromLTRB(
                                            5.w, 0, 5.w, 25.h),
                                        child: Row(
                                          children: [
                                            Container(
                                              margin: EdgeInsets.symmetric(
                                                  vertical: 5.h,
                                                  horizontal: 10),
                                              child: CircleAvatar(
                                                radius: 24.h,
                                                backgroundImage: _teamService
                                                                .teamList[index]
                                                                .logo ==
                                                            null ||
                                                        _teamService
                                                                .teamList[index]
                                                                .logo ==
                                                            ''
                                                    ? NetworkImage('')
                                                    : NetworkImage(_teamService
                                                        .teamList[index].logo
                                                        .toString()),
                                              ),
                                            ),
                                            Column(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.center,
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                Container(
                                                  width: 170.w,
                                                  child: Text(
                                                    _teamService
                                                        .teamList[index].name
                                                        .toString(),
                                                    maxLines: 2,
                                                    overflow:
                                                        TextOverflow.ellipsis,
                                                    style: themeData()
                                                        .textTheme
                                                        .bodyText1!
                                                        .copyWith(
                                                          fontSize: 12.sp,
                                                          fontWeight:
                                                              FontWeight.bold,
                                                          color: KRed,
                                                        ),
                                                  ),
                                                ),
                                                Text(
                                                  'Team size: ' +
                                                      _teamService
                                                          .teamList[index]
                                                          .teamSize
                                                          .toString(),
                                                  style: themeData()
                                                      .textTheme
                                                      .bodyText1!
                                                      .copyWith(
                                                        fontSize: 9.sp,
                                                      ),
                                                )
                                              ],
                                            ),
                                            Expanded(
                                              child: Container(),
                                            ),
                                            Container(
                                              margin:
                                                  EdgeInsets.only(right: 10),
                                              child: Row(
                                                children: [
                                                  _teamService.teamList[index]
                                                              .status ==
                                                          'pending'
                                                      ? GestureDetector(
                                                          child: Container(
                                                            margin:
                                                                EdgeInsets.only(
                                                                    left: 10),
                                                            child: Image.asset(
                                                              "assets/images/teamListDelete.webp",
                                                              height: 15,
                                                            ),
                                                          ),
                                                          onTap: () async {
                                                            bool success = await _teamService
                                                                .cancelTeamRequest(
                                                                    _teamService
                                                                        .teamList[
                                                                            index]
                                                                        .id);
                                                            if (success) {
                                                              setState(() {
                                                                print("ffffff");
                                                                // buttonMsg =
                                                                //     "Join";
                                                                // buttonCol =
                                                                //     teamListColor[
                                                                //         2];
                                                                _teamService
                                                                    .teamList[
                                                                        index]
                                                                    .status = null;
                                                                _teamService
                                                                    .teamList[
                                                                        index]
                                                                    .isJoined = false;
                                                              });
                                                            }
                                                          },
                                                        )
                                                      : SizedBox(),
                                                  GestureDetector(
                                                    child: Container(
                                                      margin: EdgeInsets.only(
                                                          left: 10),
                                                      child: Image.asset(
                                                        "assets/images/teamListInfo.webp",
                                                        height: 15,
                                                      ),
                                                    ),
                                                    onTap: () {},
                                                  ),
                                                ],
                                              ),
                                            )
                                          ],
                                        ),
                                      ),
                                    ),
                                    Positioned(
                                      right: 15.w,
                                      bottom: 10.h,
                                      child: GestureDetector(
                                        onTap: () {
                                          if (!_teamService
                                              .teamList[index].isJoined!) {
                                            _teamService.joinTeam(_teamService
                                                .teamList[index].id);
                                            setState(() {
                                              _teamService.teamList[index]
                                                  .status = 'pending';
                                            });
                                          } else {
                                            Utility.showSnackbar(AppLocalizations
                                                    .of(context)!
                                                .registeredTeamsPage_alreadyPresentSnackbar);
                                          }
                                          print("+++++++++++++++=");
                                          print(buttonMsg);
                                        },
                                        child: Container(
                                          width: 80.w,
                                          height: 25.h,
                                          decoration: BoxDecoration(
                                            color: _teamService.teamList[index]
                                                        .isJoined ==
                                                    true
                                                ? teamListColor[0]
                                                : buttonCol,
                                            borderRadius:
                                                BorderRadius.circular(2.5.w),
                                          ),
                                          child: Center(
                                            child: Text(
                                              buttonMsg,
                                              style: themeData()
                                                  .textTheme
                                                  .bodyText1!
                                                  .copyWith(
                                                      fontSize: 12.sp,
                                                      fontWeight:
                                                          FontWeight.bold,
                                                      color: Colors.white),
                                            ),
                                          ),
                                        ),
                                      ),
                                    )
                                  ],
                                ),
                              ),
                            );
                          },
                        ),
                      ],
                    ),
                  ),
                  SingleChildScrollView(
                    child: Column(
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Container(
                              margin: EdgeInsets.symmetric(vertical: 20.h),
                              child: Column(
                                children: [
                                  Container(
                                    margin: EdgeInsets.only(bottom: 10.h),
                                    height: 56.h,
                                    child: Image.asset(
                                        "assets/images/team_logo.webp"),
                                  ),
                                  Text(
                                    "List of Teams",
                                    style: themeData()
                                        .textTheme
                                        .bodyText1!
                                        .copyWith(
                                          color: profileContainerColor,
                                          fontSize: 12.sp,
                                          fontWeight: FontWeight.bold,
                                        ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                        ListView.builder(
                          physics: NeverScrollableScrollPhysics(),
                          shrinkWrap: true,
                          itemCount: _teamService.teamList.length,
                          itemBuilder: (context, index) {
                            return Container(
                              margin: EdgeInsets.only(top: 10.h),
                              child: Center(
                                child: Stack(
                                  children: [
                                    Container(
                                      height: 100.h,
                                      width: 300.w,
                                      child: Card(
                                        shape: RoundedRectangleBorder(
                                            borderRadius:
                                                BorderRadius.circular(2.5.w)),
                                        elevation: 3,
                                        margin: EdgeInsets.fromLTRB(
                                            5.w, 0, 5.w, 25.h),
                                        child: Row(
                                          children: [
                                            Container(
                                              margin: EdgeInsets.symmetric(
                                                  vertical: 5.h,
                                                  horizontal: 10),
                                              child: CircleAvatar(
                                                radius: 24.h,
                                                backgroundImage: _teamService
                                                                .teamList[index]
                                                                .logo ==
                                                            null ||
                                                        _teamService
                                                                .teamList[index]
                                                                .logo ==
                                                            ''
                                                    ? NetworkImage('')
                                                    : NetworkImage(_teamService
                                                        .teamList[index].logo
                                                        .toString()),
                                              ),
                                            ),
                                            Column(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.center,
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                Container(
                                                  width: 170.w,
                                                  child: Text(
                                                    _teamService
                                                        .teamList[index].name
                                                        .toString(),
                                                    maxLines: 2,
                                                    overflow:
                                                        TextOverflow.ellipsis,
                                                    style: themeData()
                                                        .textTheme
                                                        .bodyText1!
                                                        .copyWith(
                                                          fontSize: 12.sp,
                                                          fontWeight:
                                                              FontWeight.bold,
                                                          color: KRed,
                                                        ),
                                                  ),
                                                ),
                                                Text(
                                                  'Team size: ' +
                                                      _teamService
                                                          .teamList[index]
                                                          .teamSize
                                                          .toString(),
                                                  style: themeData()
                                                      .textTheme
                                                      .bodyText1!
                                                      .copyWith(
                                                        fontSize: 9.sp,
                                                      ),
                                                )
                                              ],
                                            ),
                                            Expanded(
                                              child: Container(),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                    Positioned(
                                      right: 15.w,
                                      bottom: 10.h,
                                      child: Row(
                                        children: [
                                          GestureDetector(
                                            onTap: () {},
                                            child: Container(
                                              margin:
                                                  EdgeInsets.only(right: 10),
                                              width: 40.w,
                                              height: 25.h,
                                              decoration: BoxDecoration(
                                                color: containerGreen,
                                                borderRadius:
                                                    BorderRadius.circular(
                                                        2.5.w),
                                              ),
                                              child: Center(
                                                child: Icon(
                                                  Icons.check,
                                                  color: Colors.white,
                                                ),
                                              ),
                                            ),
                                          ),
                                          GestureDetector(
                                            onTap: () {},
                                            child: Container(
                                              width: 40.w,
                                              height: 25.h,
                                              decoration: BoxDecoration(
                                                color: KRed,
                                                borderRadius:
                                                    BorderRadius.circular(
                                                        2.5.w),
                                              ),
                                              child: Center(
                                                child: Icon(
                                                  Icons.close,
                                                  color: Colors.white,
                                                ),
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    )
                                  ],
                                ),
                              ),
                            );
                          },
                        ),
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
