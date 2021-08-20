import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:provider/single_child_widget.dart';
import 'package:vamos/core/service/controller/authController.dart';
import 'package:vamos/ui/utils/color.dart';
import 'package:vamos/ui/utils/theme.dart';
import 'package:vamos/widget/customAppBar.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:vamos/widget/customBottomNavBar.dart';

class TeamListScreen extends StatelessWidget {
  const TeamListScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    List<int> dummyTeamList = [0, 1, 1, 2, 0];

    List<Color> dummyTeamListColor = [moneyBox, containerGreen, KRed];

    List<String> dummyTestListStatus = ["Request", "Pending", "Join"];
    return SafeArea(
      child: GetBuilder<AuthController>(
        builder: (_authService) => Directionality(
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
                          itemCount: dummyTeamList.length,
                          itemBuilder: (context, index) {
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
                                          child: Image.asset(
                                              'assets/images/placeholder_team_icon.png'),
                                        ),
                                        Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Text(
                                              "Wind City Rampage",
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
                                              "Lorem Ipsum Text",
                                              style: themeData()
                                                  .textTheme
                                                  .bodyText1!
                                                  .copyWith(
                                                    fontSize: 8.8.sp,
                                                  ),
                                            )
                                          ],
                                        ),
                                        Expanded(
                                          child: Container(),
                                        ),
                                        dummyTeamList[index] == 1
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
                                  child: Container(
                                    width: 120.w,
                                    height: 25.h,
                                    decoration: BoxDecoration(
                                      color: dummyTeamListColor[
                                          dummyTeamList[index]],
                                      borderRadius:
                                          BorderRadius.circular(2.5.w),
                                    ),
                                    child: Center(
                                      child: Text(
                                        dummyTestListStatus[
                                            dummyTeamList[index]],
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
