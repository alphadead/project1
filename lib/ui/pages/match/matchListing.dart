import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:vamos/core/models/match/matchRequestRecvdByTeam.dart';
import 'package:vamos/core/service/controller/matchController.dart';
import 'package:vamos/core/models/match/matchListResponse.dart';
import 'package:vamos/ui/utils/color.dart';
import 'package:vamos/ui/utils/theme.dart';
import 'package:vamos/widget/common/AlertDialog/matchDetailsAlert.dart';
import 'package:vamos/widget/common/pageHeaders.dart';
import 'package:vamos/widget/formWidgets/buttons.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:vamos/widget/customAppBar.dart';
import 'package:vamos/widget/customBottomNavBar.dart';

class MatchListing extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _MatchListingState();
  }
}

class _MatchListingState extends State<MatchListing> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance!.addPostFrameCallback((_) {
      Get.put(MatchController()).getMatchList();
      Get.put(MatchController()).getIncomingRequestsByTeam();
    });
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: GetBuilder<MatchController>(
        builder: (matchService) => Directionality(
          textDirection: TextDirection.ltr,
          child: Scaffold(
            floatingActionButtonLocation:
                FloatingActionButtonLocation.miniCenterDocked,
            floatingActionButton: homeFABBottomNav(),
            bottomNavigationBar: CustomBottomAppBar(
              height: 50.h,
            ),
            appBar: PreferredSize(
              preferredSize: Size.fromHeight(100.h),
              child: CustomAppBar(
                tabBar: const TabBar(
                  indicatorColor: KRed,
                  tabs: [
                    Tab(
                      icon: Text(
                        "My Matches",
                        style: TextStyle(
                          fontSize: 12,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    Tab(
                      icon: Text(
                        "Incoming Requests",
                        style: TextStyle(
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
                myMatches(matchService),
                incomingRequests(matchService)
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget myMatches(matchService) {
    return Stack(
      children: [
        SingleChildScrollView(
          child: Column(
            children: [
              pageHeader("List of Matches", "assets/images/team_logo.webp"),
              ListView.builder(
                  physics: NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                  itemCount: matchService.matches?.length ?? 0,
                  itemBuilder: (context, index) {
                    Match? match = matchService.matches?[index];
                    return GestureDetector(
                      onTap: () {
                        matchDetailsDialog(
                            context: context,
                            matchName: match?.name ?? "No Data",
                            groundName: match!.groundName ?? "no data",
                            groundLocation: match.groundLocation ?? "no data",
                            bookingFee: match.bookingFee ?? "no data",
                            status: match.status ?? "no data",
                            onAccept: () {
                              Get.put(MatchController())
                                  .getTeamRequestsByMatch(match.id);
                            },
                            onReject: () {
                              Get.back();
                            },
                            acceptText: "View",
                            rejectText: "Cancel");
                      },
                      child: Container(
                        margin: EdgeInsets.only(top: 10.h),
                        child: Center(
                          child: Container(
                            height: 100.h,
                            width: 300.w,
                            child: Card(
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(2.5.w)),
                              elevation: 3,
                              margin: EdgeInsets.fromLTRB(5.w, 0, 5.w, 25.h),
                              child: Row(children: [
                                Container(
                                    height: 54.h,
                                    margin: EdgeInsets.symmetric(
                                        vertical: 5.h, horizontal: 15),
                                    child: CircleAvatar(
                                        radius: 20.h,
                                        backgroundImage: AssetImage(
                                            'assets/images/placeholder_team_icon.png'))),
                                Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Container(
                                      width: 170.w,
                                      child: Text(
                                        match?.name?.toString() ?? "",
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
                                      'Time Slot: ' +
                                          "${match?.bookingTimeSlots?.first['opening_time']} -  ${match?.bookingTimeSlots?.first['closing_time']} ",
                                      style: themeData()
                                          .textTheme
                                          .bodyText1!
                                          .copyWith(
                                            fontSize: 11.sp,
                                          ),
                                    )
                                  ],
                                ),
                              ]),
                            ),
                          ),
                        ),
                      ),
                    );
                  }),
            ],
          ),
        ),
        Align(
          alignment: Alignment.bottomRight,
          child: Padding(
            padding: EdgeInsets.only(right: 10.w, bottom: 10.h),
            child: FloatingActionButton(
              heroTag: null,
              backgroundColor: containerGreen,
              child: Container(
                child: Icon(Icons.add),
              ),
              onPressed: () {
                Get.toNamed('/aboutMatch');
              },
            ),
          ),
        )
      ],
    );
  }

  Widget incomingRequests(MatchController matchService) {
    return SingleChildScrollView(
      child: Column(
        children: [
          pageHeader("List of Matches", "assets/images/team_logo.webp"),
          ListView.builder(
            physics: NeverScrollableScrollPhysics(),
            shrinkWrap: true,
            itemCount: matchService.matchRequests?.length ?? 0,
            itemBuilder: (context, index) {
              MatchRequest? match = matchService.matchRequests?[index];
              return GestureDetector(
                onTap: () {
                  matchDetailsDialog(
                      context: context,
                      matchName: match?.matchName ?? "No Data",
                      groundName: match!.groundName ?? "no data",
                      groundLocation: match.groundLocation ?? "no data",
                      bookingFee: match.bookingFee ?? "no data",
                      status: match.status ?? "no data",
                      onAccept: () {
                        matchService.matchId = int.parse(match.matchId!);
                        matchService.requestId = match.id;
                        matchService.update();
                        Get.back();
                        Get.toNamed("/createTeamForMatch", arguments: true);
                      },
                      onReject: () {
                        matchService.updateRequest(match.id, match.matchId, "Reject");
                      },
                      acceptText: "Accept",
                      rejectText: "Reject");
                },
                child: Container(
                  margin: EdgeInsets.only(top: 10.h),
                  child: Center(
                      child: Stack(children: [
                    Container(
                      height: 100.h,
                      width: 300.w,
                      child: Card(
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(2.5.w)),
                        elevation: 3,
                        margin: EdgeInsets.fromLTRB(5.w, 0, 5.w, 25.h),
                        child: Row(children: [
                          Container(
                              height: 54.h,
                              margin: EdgeInsets.symmetric(
                                  vertical: 5.h, horizontal: 15),
                              child: CircleAvatar(
                                  radius: 20.h,
                                  backgroundImage: AssetImage(
                                      'assets/images/placeholder_team_icon.png'))),
                          Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Container(
                                width: 170.w,
                                child: Text(
                                  match?.matchName?.toString() ?? "",
                                  maxLines: 2,
                                  overflow: TextOverflow.ellipsis,
                                  style:
                                      themeData().textTheme.bodyText1!.copyWith(
                                            fontSize: 12.sp,
                                            fontWeight: FontWeight.bold,
                                            color: KRed,
                                          ),
                                ),
                              ),
                            ],
                          ),
                        ]),
                      ),
                    ),
                    // Positioned(
                    //   right: 15.w,
                    //   bottom: 10.h,
                    //   child: Row(
                    //     children: [
                    //       GestureDetector(
                    //         onTap: () {
                    //           matchService.updateRequest(
                    //               match?.id, match?.matchId, "Accept");
                    //           matchService.matchRequests?.removeAt(index);
                    //           matchService.update();

                    //         },
                    //         child: Container(
                    //           margin: EdgeInsets.only(right: 10),
                    //           //width: 40.w,
                    //           height: 25.h,
                    //           decoration: BoxDecoration(
                    //             color: containerGreen,
                    //             borderRadius: BorderRadius.circular(2.5.w),
                    //           ),
                    //           child: Center(
                    //               child: Padding(
                    //             padding:
                    //                 EdgeInsets.only(left: 5.0.w, right: 5.w),
                    //             child: Text(
                    //               "Accept",
                    //               style:
                    //                   themeData().textTheme.bodyText1!.copyWith(
                    //                         color: Colors.white,
                    //                         fontSize: 12.sp,
                    //                         fontWeight: FontWeight.bold,
                    //                       ),
                    //             ),
                    //           )),
                    //         ),
                    //       ),
                    //       GestureDetector(
                    //         onTap: () {
                    //           matchService.updateRequest(
                    //               match?.id, match?.matchId, "Reject");
                    //           matchService.matchRequests?.removeAt(index);
                    //           matchService.update();
                    //         },
                    //         child: Container(
                    //           //  width: 40.w,
                    //           height: 25.h,
                    //           decoration: BoxDecoration(
                    //             color: KRed,
                    //             borderRadius: BorderRadius.circular(2.5.w),
                    //           ),
                    //           child: Center(
                    //               child: Padding(
                    //             padding: EdgeInsets.only(left: 5.w, right: 5.w),
                    //             child: Text(
                    //               "Reject",
                    //               style:
                    //                   themeData().textTheme.bodyText1!.copyWith(
                    //                         color: Colors.white,
                    //                         fontSize: 12.sp,
                    //                         fontWeight: FontWeight.bold,
                    //                       ),
                    //             ),
                    //           )),
                    //         ),
                    //       ),

                    //     ],
                    //   ),
                    // )
                  ])),
                ),
              );
            },
          )
        ],
      ),
    );
  }
}
