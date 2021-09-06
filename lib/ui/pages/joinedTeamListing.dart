import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:vamos/core/service/controller/teamListingController.dart';
import 'package:vamos/ui/utils/color.dart';
import 'package:vamos/ui/utils/theme.dart';
import 'package:vamos/widget/formWidgets/buttons.dart';
import 'package:vamos/widget/customAppBar.dart';
import 'package:vamos/widget/customBottomNavBar.dart';

class JoinedTeamListingScreen extends StatefulWidget {
  @override
  _JoinedTeamListingScreenState createState() =>
      _JoinedTeamListingScreenState();
}

class _JoinedTeamListingScreenState extends State<JoinedTeamListingScreen> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance!.addPostFrameCallback(
        (_) => Get.find<TeamListController>().getJoinedTeams());
  }

  @override
  Widget build(BuildContext context) {
    return GetBuilder<TeamListController>(
      builder: (_teamService) => Scaffold(
          appBar: PreferredSize(
            preferredSize: Size.fromHeight(60.h),
            child: CustomAppBar(
              isPencil: true,
            ),
          ),
          floatingActionButtonLocation: 
                  FloatingActionButtonLocation.miniCenterDocked,
          floatingActionButton: homeFABBottomNav(),
          bottomNavigationBar: CustomBottomAppBar(
            height: 50.h,
          ),
          body: SingleChildScrollView(
            child: Column(children: [
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
                          child: Image.asset("assets/images/team_logo.webp"),
                        ),
                        Text(
                          "List of Teams",
                          style: themeData().textTheme.bodyText1!.copyWith(
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
                itemCount: _teamService.joinedTeamList?.length,
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
                                  borderRadius: BorderRadius.circular(2.5.w)),
                              elevation: 3,
                              margin: EdgeInsets.fromLTRB(5.w, 0, 5.w, 25.h),
                              child: Row(
                                children: [
                                  Container(
                                    margin: EdgeInsets.symmetric(
                                        vertical: 5.h, horizontal: 10),
                                    child: CircleAvatar(
                                      radius: 24.h,
                                      backgroundImage: _teamService
                                                      .joinedTeamList![index]
                                                      .logo ==
                                                  null ||
                                              _teamService
                                                      .joinedTeamList![index]
                                                      .logo ==
                                                  ''
                                          ? NetworkImage('')
                                          : NetworkImage(_teamService
                                              .joinedTeamList![index].logo
                                              .toString()),
                                    ),
                                  ),
                                  Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Container(
                                        width: 170.w,
                                        child: Text(
                                          _teamService
                                              .joinedTeamList![index].name
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
                                              ),
                                        ),
                                      ),
                                      Text(
                                        'Team size: ' +
                                            _teamService
                                                .joinedTeamList![index].teamSize
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
                        ],
                      ),
                    ),
                  );
                },
              ),
            ]),
          )),
    );
  }
}
