import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get_core/get_core.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:vamos/core/service/controller/matchController.dart';
import 'package:vamos/core/service/controller/myTeamController.dart';
import 'package:vamos/core/service/controller/teamListingController.dart';
import 'package:vamos/ui/utils/color.dart';
import 'package:vamos/ui/utils/loginbkground.dart';
import 'package:vamos/ui/utils/theme.dart';
import 'package:vamos/ui/utils/utility.dart';
import 'package:vamos/widget/customAppBar.dart';
import 'package:vamos/widget/customBottomNavBar.dart';
import 'package:vamos/widget/formWidgets/buttons.dart';
import 'package:vamos/widget/localeFloatingActionButtonDebug.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:vamos/widget/teamWidgets/registeredTeamCard.dart';

class InviteTeamPage extends StatefulWidget {
  const InviteTeamPage({Key? key}) : super(key: key);

  @override
  _InviteTeamPageState createState() => _InviteTeamPageState();
}

class _InviteTeamPageState extends State<InviteTeamPage> {
  bool pressed = false;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance!.addPostFrameCallback((_) {
      Get.put(TeamListController()).getteamlist();
    });
  }

  @override
  Widget build(BuildContext context) {
    String buttonMsg;
    Color buttonCol;
    List<Color> teamListColor = [moneyBox, containerGreen, KRed];

    return SafeArea(
        child: GetBuilder<TeamListController>(
      builder: (_teamService) => Directionality(
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
          body: Stack(
            children: [
              SingleChildScrollView(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Container(
                      child: Column(
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
                                  AppLocalizations.of(context)!
                                      .invite_teams_forMatch,
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
                          Container(
                            height: 20.h,
                          ),
                          ListView.builder(
                            physics: NeverScrollableScrollPhysics(),
                            shrinkWrap: true,
                            itemCount: _teamService.teamList.length,
                            itemBuilder: (context, index) {
                              return ListView.builder(
                                physics: NeverScrollableScrollPhysics(),
                                shrinkWrap: true,
                                itemCount: _teamService.teamList.length,
                                itemBuilder: (context, index) {
                                  buttonMsg =
                                      (_teamService.teamList[index].status ==
                                              "pending")
                                          ? "Pending"
                                          : "Request";

                                  buttonCol =
                                      (_teamService.teamList[index].status ==
                                              "pending")
                                          ? teamListColor[2]
                                          : teamListColor[0];
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
                                                      BorderRadius.circular(
                                                          2.5.w)),
                                              elevation: 3,
                                              margin: EdgeInsets.fromLTRB(
                                                  5.w, 0, 5.w, 25.h),
                                              child: Row(
                                                children: [
                                                  Container(
                                                    margin:
                                                        EdgeInsets.symmetric(
                                                            vertical: 5.h,
                                                            horizontal: 10),
                                                    child: CircleAvatar(
                                                      radius: 24.h,
                                                      backgroundImage: _teamService
                                                                      .teamList[
                                                                          index]
                                                                      .logo ==
                                                                  null ||
                                                              _teamService
                                                                      .teamList[
                                                                          index]
                                                                      .logo ==
                                                                  ''
                                                          ? CachedNetworkImageProvider(
                                                              '')
                                                          : CachedNetworkImageProvider(
                                                              _teamService
                                                                  .teamList[
                                                                      index]
                                                                  .logo
                                                                  .toString()),
                                                    ),
                                                  ),
                                                  Column(
                                                    mainAxisAlignment:
                                                        MainAxisAlignment
                                                            .center,
                                                    crossAxisAlignment:
                                                        CrossAxisAlignment
                                                            .start,
                                                    children: [
                                                      Container(
                                                        width: 170.w,
                                                        child: Text(
                                                          _teamService
                                                              .teamList[index]
                                                              .name
                                                              .toString(),
                                                          maxLines: 2,
                                                          overflow: TextOverflow
                                                              .ellipsis,
                                                          style: themeData()
                                                              .textTheme
                                                              .bodyText1!
                                                              .copyWith(
                                                                fontSize: 12.sp,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .bold,
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
                                                    margin: EdgeInsets.only(
                                                        right: 10),
                                                    child: Row(
                                                      children: [
                                                        _teamService
                                                                    .teamList[
                                                                        index]
                                                                    .status ==
                                                                'pending'
                                                            ? GestureDetector(
                                                                child:
                                                                    Container(
                                                                  margin: EdgeInsets
                                                                      .only(
                                                                          left:
                                                                              5),
                                                                  child: Image
                                                                      .asset(
                                                                    "assets/images/teamListDelete.webp",
                                                                    height: 15,
                                                                  ),
                                                                ),
                                                                onTap:
                                                                    () async {
                                                                  bool success = await _teamService.cancelTeamRequestByMatch(_teamService
                                                                      .teamList[
                                                                          index]
                                                                      .requestId);
                                                                  if (success) {
                                                                    setState(
                                                                        () {
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
                                                            padding:
                                                                EdgeInsets.only(
                                                                    left: 5),
                                                            child: Image.asset(
                                                              "assets/images/teamListInfo.webp",
                                                              height: 15,
                                                            ),
                                                          ),
                                                          onTap: () {
                                                            Get.put(MyTeamController())
                                                                .getParticularTeamDetails(
                                                                    _teamService
                                                                        .teamList[
                                                                            index]
                                                                        .id!);
                                                          },
                                                        ),
                                                      ],
                                                    ),
                                                  )
                                                ],
                                              ),
                                            ),
                                          ),
                                          _teamService.userType == "Ground"
                                              ? SizedBox()
                                              : GetBuilder<MatchController>(
                                                builder: (_matchService) {
                                                  return Positioned(
                                                      right: 15.w,
                                                      bottom: 10.h,
                                                      child: GestureDetector(
                                                        onTap: () {
                                                          if (!_teamService
                                                              .teamList[index]
                                                              .isJoined!) {
                                                            Get.find<
                                                                    MatchController>()
                                                                .requestMatch(
                                                                    index,
                                                                    _teamService
                                                                        .teamList[
                                                                            index]
                                                                        .id
                                                                        .toString());
                                                          } else {
                                                            Utility.showSnackbar(
                                                                AppLocalizations.of(
                                                                        context)!
                                                                    .registeredTeamsPage_alreadyPresentSnackbar);
                                                          }
                                                        },
                                                        child: Container(
                                                          width: 80.w,
                                                          height: 25.h,
                                                          decoration: BoxDecoration(
                                                            color: _teamService
                                                                        .teamList[
                                                                            index]
                                                                        .isJoined ==
                                                                    true
                                                                ? teamListColor[0]
                                                                : buttonCol,
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        2.5.w),
                                                          ),
                                                          child: Center(
                                                            child: Text(
                                                              buttonMsg,
                                                              style: themeData()
                                                                  .textTheme
                                                                  .bodyText1!
                                                                  .copyWith(
                                                                      fontSize:
                                                                          12.sp,
                                                                      fontWeight:
                                                                          FontWeight
                                                                              .bold,
                                                                      color: Colors
                                                                          .white),
                                                            ),
                                                          ),
                                                        ),
                                                      ),
                                                    );
                                                }
                                              )
                                        ],
                                      ),
                                    ),
                                  );
                                },
                              );
                            },
                          ),
                        ],
                      ),
                    )
                  ],
                ),
              ),
              Align(
                alignment: Alignment.bottomRight,
                child: Padding(
                  padding: EdgeInsets.only(right: 10.w, bottom: 10.h),
                  child: LocaleFloatingActionButton(),
                ),
              ),
              Align(
                alignment: Alignment.bottomCenter,
                child: Container(
                  padding: EdgeInsets.symmetric(vertical: 35),
                  child: primaryActionButton(
                      context: context,
                      onPressed: () {
                        Get.offAllNamed("/homeScreen");
                      }),
                ),
              )
            ],
          ),
        ),
      ),
    ));
  }
}
