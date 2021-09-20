import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:vamos/core/models/playerRequestResponse.dart';
import 'package:vamos/core/service/controller/myTeamController.dart';
import 'package:vamos/core/service/controller/teamListingController.dart';
import 'package:vamos/ui/utils/color.dart';
import 'package:vamos/widget/formWidgets/buttons.dart';
import 'package:vamos/widget/customAppBar.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:vamos/ui/utils/theme.dart';
import 'package:vamos/widget/customBottomNavBar.dart';

class MyTeam extends StatefulWidget {
  const MyTeam({Key? key}) : super(key: key);

  @override
  _MyTeamState createState() => _MyTeamState();
}

class _MyTeamState extends State<MyTeam> {
  bool joinedTeamListView = true;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance!.addPostFrameCallback(
        (_) => Get.find<MyTeamController>().getTeamInfo());
  }

  @override
  Widget build(BuildContext context) {
    return GetBuilder<MyTeamController>(
      builder: (_myTeamService) => Scaffold(
        resizeToAvoidBottomInset: false,
        backgroundColor: sliderGreenActive,
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
        body: _myTeamService.teamInfo == null
            ? Center(
                child: Text(
                "Please create a team to continue.",
                style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 16),
              ))
            : SingleChildScrollView(
                child: Column(
                  children: [
                    Container(
                      margin: EdgeInsets.only(bottom: 10.h),
                      height: 250.h,
                      child: Stack(
                        alignment: AlignmentDirectional.bottomEnd,
                        fit: StackFit.expand,
                        children: [
                          Positioned(
                            left: -130.w,
                            child: Image.asset(
                              "assets/images/rectangle_1.webp",
                              color: titleText,
                              width: 1.50.sw,
                              fit: BoxFit.fitWidth,
                            ),
                          ),
                          Positioned(
                            bottom: -60.h,
                            left: 80.w,
                            height: 330.h,
                            width: 330.w,
                            child: Image.asset(
                              'assets/images/group_3.png',
                            ),
                          ),
                          Positioned(
                            top: 10.0.h,
                            left: 120.0.w,
                            child: Container(
                              width: 150.w,
                              child: Text(
                                'My Team',
                                style: TextStyle(
                                  color: sliderGreenActive,
                                  fontSize: 20.sp,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Container(
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(3)),
                      width: 300.w,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          GetBuilder<MyTeamController>(
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
                                              ? CachedNetworkImageProvider('')
                                              : CachedNetworkImageProvider(
                                                  _myTeamInfo.teamInfo?.logo
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
                                  IconButton(
                                    onPressed: () {
                                      Get.toNamed('/playerList');
                                    },
                                    icon: Icon(
                                      Icons.add_circle_outline,
                                      color: sliderGreenActive,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                          Divider(
                            height: 10,
                            thickness: 2,
                            endIndent: 0,
                            indent: 0,
                          ),
                          Padding(
                            padding: const EdgeInsets.fromLTRB(20, 10, 20, 10),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: [
                                primaryActionButtonKRed(() {
                                  _myTeamService.getPlayerJoinedListByTeam();

                                  setState(() {
                                    joinedTeamListView = true;
                                  });
                                }, joinedTeamListView, 'Joined Player'),
                                primaryActionButtonKRed(() {
                                  setState(() {
                                    _myTeamService.getPlayerRequestListByTeam();
                                    joinedTeamListView = false;
                                  });
                                }, !joinedTeamListView, 'Requested Player'),
                              ],
                            ),
                          ),
                          SingleChildScrollView(
                            child: Container(
                              padding: EdgeInsets.fromLTRB(30, 0, 30, 0),
                              height: 180.h,
                              child: ListView.builder(
                                  shrinkWrap: true,
                                  physics: ScrollPhysics(),
                                  scrollDirection: Axis.vertical,
                                  itemCount: joinedTeamListView
                                      ? _myTeamService.playerJoinedList.length
                                      : _myTeamService.playerRequestList.length,
                                  itemBuilder:
                                      (BuildContext context, int index) {
                                    Color col = titleText;
                                    if (index % 2 == 0)
                                      col = KLightGrey.withOpacity(0.2);
                                    if (joinedTeamListView)
                                      return playerCard(
                                          col,
                                          _myTeamService
                                              .playerJoinedList[index]);
                                    else
                                      return playerCard(
                                          col,
                                          _myTeamService
                                              .playerRequestList[index],
                                          isRequest: true,
                                          index: index);
                                  }),
                            ),
                          ),
                          SizedBox(
                            height: 10.h,
                          ),
                          Center(
                            child: GestureDetector(
                              onTap: () {},
                              child: Container(
                                width: 95.h,
                                height: 30.w,
                                child: Center(
                                  child: Text(
                                    'Update',
                                    style: TextStyle(
                                      fontSize: 12.sp,
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
                          ),
                          SizedBox(
                            height: 10.h,
                          )
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 40.h,
                    )
                  ],
                ),
              ),
      ),
    );
  }

  Widget playerCard(Color col, PlayerData playerData,
      {bool isRequest = false, int? index}) {
    TeamListController _teamService = Get.find<TeamListController>();
    MyTeamController _myTeamService = Get.find<MyTeamController>();

    return Stack(
      children: [
        Container(
          color: col,
          child: Row(
            children: [
              Container(
                height: 34.h,
                margin: EdgeInsets.symmetric(vertical: 5.h, horizontal: 5),
                padding: EdgeInsets.fromLTRB(5, 0, 5, 0),
                child: CircleAvatar(
                  backgroundColor: Colors.grey.shade300,
                  radius: 15.h,
                  backgroundImage: playerData.photo!.length > 0
                      ? CachedNetworkImageProvider(playerData.photo?[0]?["url"])
                      : CachedNetworkImageProvider(""),
                ),
              ),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      (playerData.firstName ?? "") +
                          (playerData.lastName ?? ""),
                      style: themeData().textTheme.bodyText1!.copyWith(
                            fontSize: 12.sp,
                            fontWeight: FontWeight.bold,
                            color: KRed,
                          ),
                    ),
                    Text(
                      playerData.nickName ?? "",
                      style: themeData().textTheme.bodyText1!.copyWith(
                            fontSize: 9.sp,
                          ),
                    )
                  ],
                ),
              ),
            ],
          ),
        ),
        Visibility(
          visible: isRequest,
          child: Positioned(
            right: 15.w,
            bottom: 10.h,
            child: Row(
              children: [
                GestureDetector(
                  onTap: () {
                    _teamService.requestAcceptReject(
                      playerData.id,
                      "Accept",
                    );
                    setState(() {
                      _myTeamService.playerRequestList.removeAt(index!);
                      _myTeamService.update();
                    });
                  },
                  child: Container(
                    margin: EdgeInsets.only(right: 10),
                    padding: EdgeInsets.all(2.h),
                    width: 25.w,
                    height: 20.h,
                    decoration: BoxDecoration(
                      color: containerGreen,
                      borderRadius: BorderRadius.circular(2.5.w),
                    ),
                    child: Center(
                      child: Icon(
                        Icons.check,
                        color: Colors.white,
                        size: 18,
                      ),
                    ),
                  ),
                ),
                Visibility(
                  visible: isRequest,
                  child: GestureDetector(
                    onTap: () {
                      _teamService.requestAcceptReject(
                        playerData.id,
                        "Reject",
                      );
                      setState(() {
                        _myTeamService.playerRequestList.removeAt(index!);
                        _myTeamService.update();
                      });
                    },
                    child: Container(
                      padding: EdgeInsets.all(2.h),
                      width: 25.w,
                      height: 20.h,
                      decoration: BoxDecoration(
                        color: KRed,
                        borderRadius: BorderRadius.circular(2.5.w),
                      ),
                      child: Center(
                        child: Icon(
                          Icons.close,
                          color: Colors.white,
                          size: 18,
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        )
      ],
    );
  }
}
