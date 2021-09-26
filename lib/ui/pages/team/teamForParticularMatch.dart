import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:vamos/core/service/controller/myTeamController.dart';
import 'package:vamos/ui/utils/color.dart';
import 'package:vamos/ui/utils/theme.dart';
import 'package:vamos/widget/customAppBar.dart';
import 'package:vamos/widget/customBottomNavBar.dart';
import 'package:vamos/widget/formWidgets/buttons.dart';
import 'package:vamos/widget/matchWidgets/tabIndicator.dart';

class TeamForParticularMatch extends StatefulWidget {
  const TeamForParticularMatch({Key? key}) : super(key: key);

  @override
  _TeamForParticularMatchState createState() => _TeamForParticularMatchState();
}

class _TeamForParticularMatchState extends State<TeamForParticularMatch> {
  @override
  Widget build(BuildContext context) {
    var teamsize = Get.arguments[0];
    var teamName = Get.arguments[1];
    var teamLogo = Get.arguments[2];
    var playerList = Get.arguments[3];

    return Scaffold(
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
      body: SingleChildScrollView(
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
                        textAlign: TextAlign.center,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Container(
              decoration: BoxDecoration(
                  color: Colors.white, borderRadius: BorderRadius.circular(3)),
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
                              backgroundImage: teamLogo == null ||
                                      teamLogo == ''
                                  ? CachedNetworkImageProvider('')
                                  : CachedNetworkImageProvider(teamLogo ?? ""),
                            ),
                          ),
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  teamName ?? "",
                                  style:
                                      themeData().textTheme.bodyText1!.copyWith(
                                            fontSize: 15.sp,
                                            fontWeight: FontWeight.bold,
                                            color: KRed,
                                          ),
                                ),
                                Text(
                                  (teamsize ?? "") +
                                      'x' +
                                      (teamsize ?? "") +
                                      ' Team',
                                  style:
                                      themeData().textTheme.bodyText1!.copyWith(
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
                  Divider(
                    height: 10,
                    thickness: 2,
                    endIndent: 0,
                    indent: 0,
                  ),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(20, 10, 20, 10),
                    child: Center(
                      child: tabIndicatorKRed("Team Preview"),
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
                          itemCount: playerList.length,
                          itemBuilder: (BuildContext context, int index) {
                            Color col = titleText;
                            if (index % 2 == 0)
                              col = KLightGrey.withOpacity(0.2);
                            return
                                //Text(playerList[index].position.toString());
                                teamPlayerForMatchCart(
                                    col,
                                    playerList[index].playerName,
                                    playerList[index].playerPhoto,
                                    playerList[index].position);
                          }),
                    ),
                  ),
                  SizedBox(
                    height: 10.h,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

Widget teamPlayerForMatchCart(
    Color col, String playerName, dynamic playerPhoto, String playerPosition) {
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
                backgroundImage: playerPhoto == "" || playerPhoto == null
                    ? CachedNetworkImageProvider("")
                    : CachedNetworkImageProvider(playerPhoto),
              ),
            ),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    (playerName),
                    style: themeData().textTheme.bodyText1!.copyWith(
                          fontSize: 12.sp,
                          fontWeight: FontWeight.bold,
                          color: KRed,
                        ),
                  ),
                  Text(
                    playerPosition,
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
    ],
  );
}
