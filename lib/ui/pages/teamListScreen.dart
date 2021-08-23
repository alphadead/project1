import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:provider/single_child_widget.dart';
import 'package:vamos/core/models/joinTeam.dart';
import 'package:vamos/core/service/controller/authController.dart';
import 'package:vamos/core/service/controller/teamListingController.dart';
import 'package:vamos/ui/utils/color.dart';
import 'package:vamos/ui/utils/theme.dart';
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
    List<int> dummyTeamList = [0, 1, 1, 2, 0];
    List<Color> dummyTeamListColor = [moneyBox, containerGreen, KRed];

    String buttonMsg;
    Color buttonCol;

    return SafeArea(
      child: GetBuilder<TeamListController>(
        builder: (_teamService) => Directionality(
          textDirection: TextDirection.ltr,
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
              preferredSize: Size.fromHeight(60.h),
              child: CustomAppBar(),
            ),
            body: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  width: 300.w,
                  child: SingleChildScrollView(
                    child: Column(
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
                                child:
                                    Image.asset("assets/images/team_logo.webp"),
                              ),
                              Text(
                                "List of Teams",
                                style:
                                    themeData().textTheme.bodyText1!.copyWith(
                                          color: profileContainerColor,
                                          fontSize: 12.sp,
                                          fontWeight: FontWeight.bold,
                                        ),
                              ),
                            ],
                          ),
                        ),
                        ListView.builder(
                          physics: NeverScrollableScrollPhysics(),
                          shrinkWrap: true,
                          itemCount: _teamService.teamList.length,
                          itemBuilder: (context, index) {
                            buttonMsg =
                                _teamService.teamList[index].status == null
                                    ? "Join"
                                    : _teamService.joinedTeam == true
                                        ? "Requested"
                                        : "Join";
                            buttonCol = _teamService.teamList[index].status
                                        .toString() ==
                                    'null'
                                ? dummyTeamListColor[2]
                                : _teamService.teamList[index].status
                                            .toString() ==
                                        'pending'
                                    ? dummyTeamListColor[0]
                                    : dummyTeamListColor[1];

                            print(_teamService.teamList[index].logo != null ||
                                _teamService.teamList[index].logo != "");
                            print("BBBBBBBBBBBBB" + index.toString());
                            return Stack(
                              children: [
                                Card(
                                  shape: RoundedRectangleBorder(
                                      borderRadius:
                                          BorderRadius.circular(2.5.w)),
                                  elevation: 3,
                                  margin:
                                      EdgeInsets.fromLTRB(5.w, 0, 5.w, 25.h),
                                  child: Container(
                                    child: Row(
                                      children: [
                                        Container(
                                          height: 54.h,
                                          margin: EdgeInsets.symmetric(
                                              vertical: 5.h, horizontal: 10),
                                          child: CircleAvatar(
                                            radius: 24.h,
                                            backgroundImage: _teamService
                                                            .teamList[index]
                                                            .logo ==
                                                        null ||
                                                    _teamService.teamList[index]
                                                            .logo ==
                                                        ''
                                                ? NetworkImage('')
                                                : NetworkImage(_teamService
                                                    .teamList[index].logo
                                                    .toString()),
                                          ),
                                        ),
                                        Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Text(
                                              _teamService.teamList[index].name
                                                  .toString(),
                                              style: themeData()
                                                  .textTheme
                                                  .bodyText1!
                                                  .copyWith(
                                                    fontSize: 12.sp,
                                                    fontWeight: FontWeight.bold,
                                                    color: KRed,
                                                  ),
                                            ),
                                            Text(
                                              'Team size: ' +
                                                  _teamService
                                                      .teamList[index].teamSize
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
                                        buttonMsg == 'Pending'
                                            ? Container(
                                                margin:
                                                    EdgeInsets.only(right: 10),
                                                child: Row(
                                                  children: [
                                                    GestureDetector(
                                                      child: Container(
                                                        margin: EdgeInsets.only(
                                                            left: 10),
                                                        child: Image.asset(
                                                          "assets/images/teamListDelete.webp",
                                                          height: 15,
                                                        ),
                                                      ),
                                                      onTap: () {},
                                                    ),
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
                                            : SizedBox(),
                                      ],
                                    ),
                                  ),
                                ),
                                Positioned(
                                  right: 15.w,
                                  bottom: 10.h,
                                  child: GestureDetector(
                                    onTap: buttonMsg == 'Join'
                                        ? () {
                                            _teamService.joinTeam(_teamService
                                                .teamList[index].id);
                                            setState(() {
                                              if (_teamService.joinedTeam ==
                                                  true) {
                                                buttonMsg = "Requested";
                                                buttonCol =
                                                    dummyTeamListColor[0];
                                              }
                                            });
                                            print(buttonMsg);
                                          }
                                        : () {},
                                    child: Container(
                                      width: 120.w,
                                      height: 25.h,
                                      decoration: BoxDecoration(
                                        color: _teamService.joinedTeam == true
                                            ? dummyTeamListColor[0]
                                            : buttonCol,
                                        borderRadius:
                                            BorderRadius.circular(2.5.w),
                                      ),
                                      child: Center(
                                        child: Text(
                                          _teamService.joinedTeam == true
                                              ? "Requested"
                                              : buttonMsg,
                                          style: themeData()
                                              .textTheme
                                              .bodyText1!
                                              .copyWith(
                                                  fontSize: 12.sp,
                                                  fontWeight: FontWeight.bold,
                                                  color: Colors.white),
                                        ),
                                      ),
                                    ),
                                  ),
                                )
                              ],
                            );
                          },
                        ),
                        Container(
                          margin: EdgeInsets.only(right: 10),
                          height: 100,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              FloatingActionButton(
                                backgroundColor: containerGreen,
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Image.asset(
                                      "assets/images/TeamListMyTeam.webp",
                                      height: 25.h,
                                    ),
                                    Text(
                                      "MyTeam",
                                      style: themeData()
                                          .textTheme
                                          .bodyText1!
                                          .copyWith(
                                              fontSize: 6.4.sp,
                                              color: Colors.white),
                                    )
                                  ],
                                ),
                                onPressed: () {},
                              ),
                            ],
                          ),
                        )
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
