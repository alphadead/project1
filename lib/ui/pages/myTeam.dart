import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:vamos/core/service/controller/myTeamController.dart';
import 'package:vamos/ui/utils/color.dart';
import 'package:vamos/widget/buttons.dart';
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
  Widget build(BuildContext context) {
    return GetBuilder<MyTeamController>(
      builder: (_myTeamService) => Scaffold(
        resizeToAvoidBottomInset: false,
        backgroundColor: sliderGreenActive,
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
                    Container(
                      child: Row(
                        children: [
                          Container(
                            height: 54.h,
                            margin: EdgeInsets.symmetric(
                                vertical: 5.h, horizontal: 15),
                            child: CircleAvatar(
                                radius: 20.h,
                                backgroundImage: AssetImage(
                                    'assets/images/placeholder_team_icon.png')),
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "Wind City Rampage",
                                style:
                                    themeData().textTheme.bodyText1!.copyWith(
                                          fontSize: 15.sp,
                                          fontWeight: FontWeight.bold,
                                          color: KRed,
                                        ),
                              ),
                              Text(
                                '6x6 Team',
                                style:
                                    themeData().textTheme.bodyText1!.copyWith(
                                          fontSize: 10.sp,
                                        ),
                              )
                            ],
                          ),
                          Padding(
                            padding: const EdgeInsets.fromLTRB(30, 0, 5, 0),
                            child: Icon(
                              Icons.add_circle_outline,
                              color: sliderGreenActive,
                            ),
                          )
                        ],
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
                          primaryActionButton(() {
                            setState(() {
                              joinedTeamListView = true;
                            });
                          }, joinedTeamListView, 'Joined Team'),
                          primaryActionButton(() {
                            setState(() {
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
                            itemCount: 20,
                            itemBuilder: (BuildContext context, int index) {
                              Color col = titleText;
                              if (index % 2 == 0)
                                col = KLightGrey.withOpacity(0.2);

                              return Container(
                                color: col,
                                child: Row(
                                  children: [
                                    Container(
                                      height: 34.h,
                                      margin: EdgeInsets.symmetric(
                                          vertical: 5.h, horizontal: 5),
                                      padding: EdgeInsets.fromLTRB(5, 0, 5, 0),
                                      child: CircleAvatar(
                                          radius: 15.h,
                                          backgroundImage: AssetImage(
                                              'assets/images/placeholder_team_icon.png')),
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
                                          '6x6 Team',
                                          style: themeData()
                                              .textTheme
                                              .bodyText1!
                                              .copyWith(
                                                fontSize: 9.sp,
                                              ),
                                        )
                                      ],
                                    ),
                                    GestureDetector(
                                      child: Container(
                                        margin: EdgeInsets.only(left: 50),
                                        child: Image.asset(
                                          "assets/images/teamListInfo.webp",
                                          height: 18,
                                        ),
                                      ),
                                      onTap: () {},
                                    ),
                                  ],
                                ),
                              );
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
}
