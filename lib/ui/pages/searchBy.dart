import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:vamos/core/models/groundList.dart';
import 'package:vamos/core/service/controller/groundController.dart';
import 'package:vamos/core/service/controller/otherPlayerInfoController.dart';
import 'package:vamos/core/service/controller/playerListingController.dart';
import 'package:vamos/core/models/playerListResponse.dart';
import 'package:vamos/core/service/controller/searchByController.dart';
import 'package:vamos/core/service/controller/teamListingController.dart';
import 'package:vamos/ui/pages/normalPlayer.dart';
import 'package:vamos/ui/pages/premiumPlayer.dart';
import 'package:vamos/ui/utils/color.dart';
import 'package:vamos/ui/utils/theme.dart';
import 'package:vamos/ui/utils/utility.dart';
import 'package:vamos/widget/customAppBar.dart';
import 'package:vamos/widget/customBottomNavBar.dart';
import 'package:vamos/widget/formWidgets/buttons.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:vamos/widget/searchWidgets/drawer.dart';

class SearchBy extends StatefulWidget {
  const SearchBy({Key? key}) : super(key: key);

  @override
  _SearchByState createState() => _SearchByState();
}

class _SearchByState extends State<SearchBy> {
  bool groundCont = false;
  bool playerCont = true;
  bool teamCont = false;
  bool normalCont = true;
  bool premiumCont = false;
  String searchSlug = '';
  List<Map<String, dynamic>> playerFilters = [
    {'displayName': 'Player Name', 'value': true, 'key': 'first_name'},
    {'displayName': 'Nationality', 'value': false, 'key': 'nationality'},
    {'displayName': 'Age', 'value': false, 'key': 'age'},
    {'displayName': 'Rating', 'value': false, 'key': 'rating'},
    {'displayName': 'Player Role', 'value': false, 'key': 'role'},
  ];

  List<Map<String, dynamic>> teamFilters = [
    {'displayName': 'Team Name', 'value': true, 'key': 'name'},
    {'displayName': 'Team Size', 'value': false, 'key': 'team_size'},
  ];
  List<Map<String, dynamic>> groundFilters = [
    {'displayName': 'Ground Name', 'value': true, 'key': 'name'},
    {'displayName': 'Ground Location', 'value': false, 'key': 'location'},
    {
      'displayName': 'Ground Availability',
      'value': false,
      'key': 'availability'
    },
  ];
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance!.addPostFrameCallback((_) {
      Get.find<TeamListController>().getteamlist();
      // Get.find<PlayerListController>().getPlayerlist();
      Get.put(SearchByController()).getGroundlist();
    });
  }

  @override
  Widget build(BuildContext context) {
    return GetBuilder<SearchByController>(
      builder: (searchService) => SafeArea(
        child: Directionality(
          textDirection: TextDirection.ltr,
          child: Scaffold(
            drawer: SearchDrawer(playerCont
                ? playerFilters
                : teamCont
                    ? teamFilters
                    : groundCont
                        ? groundFilters
                        : []),
            resizeToAvoidBottomInset: false,
            floatingActionButtonLocation:
                FloatingActionButtonLocation.miniCenterDocked,
            floatingActionButton: homeFABBottomNav(),
            bottomNavigationBar: CustomBottomAppBar(height: 50.h),
            appBar: PreferredSize(
              preferredSize: Size.fromHeight(60.h),
              child: CustomAppBar(),
            ),
            body: SingleChildScrollView(
              child: Column(
                children: [
                  GetBuilder<PlayerListController>(
                      builder: (_playerService) => searchBar(_playerService)),
                  Center(
                    child: Container(
                      height: 100.h,
                      margin: EdgeInsets.symmetric(vertical: 20.h),
                      child: Column(
                        children: [
                          Container(
                            margin: EdgeInsets.symmetric(vertical: 8.h),
                            height: 56.h,
                            child: Image.asset('assets/images/searchPage.webp'),
                          ),
                          Text(
                            'Search By',
                            style: themeData().textTheme.bodyText1!.copyWith(
                                  color: profileContainerColor,
                                  fontSize: 12.sp,
                                  fontWeight: FontWeight.bold,
                                ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 30),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        GestureDetector(
                          onTap: () {
                            setState(() {
                              groundCont = false;
                              playerCont = true;
                              teamCont = false;
                            });
                          },
                          child: Container(
                            width: 90.w,
                            height: 30.h,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(4),
                              color: playerCont ? KRed : moneyBox,
                            ),
                            child: Center(
                              child: Text(
                                'Player',
                                style: themeData()
                                    .textTheme
                                    .headline2!
                                    .copyWith(fontSize: 10.sp),
                              ),
                            ),
                          ),
                        ),
                        GestureDetector(
                          onTap: () {
                            setState(() {
                              groundCont = false;
                              playerCont = false;
                              teamCont = true;
                            });
                          },
                          child: Container(
                            width: 90.w,
                            height: 30.h,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(4),
                              color: teamCont ? KRed : moneyBox,
                            ),
                            child: Center(
                              child: Text(
                                'Team',
                                style: themeData()
                                    .textTheme
                                    .headline2!
                                    .copyWith(fontSize: 10.sp),
                              ),
                            ),
                          ),
                        ),
                        GestureDetector(
                          onTap: () {
                            setState(() {
                              groundCont = true;
                              playerCont = false;
                              teamCont = false;
                            });
                          },
                          child: Container(
                            width: 90.w,
                            height: 30.h,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(4),
                              color: groundCont ? KRed : moneyBox,
                            ),
                            child: Center(
                              child: Text(
                                'Ground',
                                style: themeData()
                                    .textTheme
                                    .headline2!
                                    .copyWith(fontSize: 10.sp),
                              ),
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                  playerCont
                      ? playerContainer(
                          Get.find<PlayerListController>(), searchSlug, context)
                      : teamCont
                          ? teamContainer(
                              Get.find<TeamListController>(), searchSlug)
                          : groundCont
                              ? groundContainer(searchService, searchSlug)
                              : Container(),
                  SizedBox(
                    height: 20.h,
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget groundContainer(_groundService, String item) {
    return Column(
      children: [
        filterBar(item),
        SizedBox(height: 10.h),
        ListView.builder(
          physics: NeverScrollableScrollPhysics(),
          shrinkWrap: true,
          itemCount: _groundService.groundList.length,
          itemBuilder: (context, index) {
            Grounds ground = _groundService.groundList[index] as Grounds;
            if (ground.name.toString().toLowerCase().contains(item)) {
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
                                    vertical: 0.h, horizontal: 10),
                                child: CircleAvatar(
                                  radius: 18.h,
                                  backgroundImage: AssetImage(
                                      'assets/images/placeholder_team_icon.png'),
                                ),
                              ),
                              Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Container(
                                    width: 170.w,
                                    child: Text(
                                      ground.name.toString(),
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
                                    'Location: ' + '${ground.location}',
                                    style: themeData()
                                        .textTheme
                                        .bodyText1!
                                        .copyWith(
                                          fontSize: 9.sp,
                                        ),
                                  )
                                ],
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              );
            } else {
              return Container();
            }
          },
        ),
      ],
    );
  }

  Widget teamContainer(_teamService, String item) {
    List<Color> teamListColor = [moneyBox, containerGreen, KRed];

    String buttonMsg;
    Color buttonCol;

    return Column(
      children: [
        SizedBox(height: 10.h),
        filterBar(item),
        ListView.builder(
          physics: NeverScrollableScrollPhysics(),
          shrinkWrap: true,
          itemCount: _teamService.teamList.length,
          itemBuilder: (context, index) {
            if (_teamService.teamList[index].name
                .toString()
                .toLowerCase()
                .contains(item)) {
              buttonMsg = _teamService.teamList[index].status == null
                  ? "Request"
                  : _teamService.teamList[index].status == "Join"
                      ? "Joined"
                      : "Pending";
              buttonCol = _teamService.teamList[index].status == null
                  ? teamListColor[0]
                  : _teamService.teamList[index].status.toString() == 'pending'
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
                                                  .teamList[index].logo ==
                                              null ||
                                          _teamService.teamList[index].logo ==
                                              ''
                                      ? CachedNetworkImageProvider('')
                                      : CachedNetworkImageProvider(_teamService
                                          .teamList[index].logo
                                          .toString()),
                                ),
                              ),
                              Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Container(
                                    width: 170.w,
                                    child: Text(
                                      _teamService.teamList[index].name
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
                                        _teamService.teamList[index].teamSize
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
                                margin: EdgeInsets.only(right: 10),
                                child: Row(
                                  children: [
                                    _teamService.teamList[index].status ==
                                            'pending'
                                        ? GestureDetector(
                                            child: Container(
                                              margin: EdgeInsets.only(left: 5),
                                              child: Image.asset(
                                                "assets/images/teamListDelete.webp",
                                                height: 15,
                                              ),
                                            ),
                                            onTap: () async {
                                              bool success = await _teamService
                                                  .cancelTeamRequest(
                                                      _teamService
                                                          .teamList[index].id);
                                              if (success) {
                                                setState(() {
                                                  _teamService.teamList[index]
                                                      .status = null;
                                                  _teamService.teamList[index]
                                                      .isJoined = false;
                                                });
                                              }
                                            },
                                          )
                                        : SizedBox(),
                                    GestureDetector(
                                      child: Container(
                                        padding: EdgeInsets.only(left: 5),
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
                      _teamService.userType == "Ground"
                          ? SizedBox()
                          : Positioned(
                              right: 15.w,
                              bottom: 10.h,
                              child: GestureDetector(
                                onTap: () {
                                  if (!_teamService.teamList[index].isJoined!) {
                                    _teamService.joinTeam(
                                        _teamService.teamList[index].id);
                                    setState(() {
                                      _teamService.teamList[index].status =
                                          'pending';
                                    });
                                  } else {
                                    Utility.showSnackbar(AppLocalizations.of(
                                            context)!
                                        .registeredTeamsPage_alreadyPresentSnackbar);
                                  }
                                },
                                child: Container(
                                  width: 80.w,
                                  height: 25.h,
                                  decoration: BoxDecoration(
                                    color:
                                        _teamService.teamList[index].isJoined ==
                                                true
                                            ? teamListColor[0]
                                            : buttonCol,
                                    borderRadius: BorderRadius.circular(2.5.w),
                                  ),
                                  child: Center(
                                    child: Text(
                                      buttonMsg,
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
                  ),
                ),
              );
            } else {
              return Container();
            }
          },
        ),
      ],
    );
  }

  Widget playerContainer(
      _searchByService, String item, BuildContext currentContext) {
    String buttonMsg;
    Color buttonCol;
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10),
      child: Container(
        width: 300.w,
        height: 320.h,
        decoration: BoxDecoration(
            color: KLightGrey.withOpacity(0.15),
            borderRadius: BorderRadius.circular(3)),
        child: Padding(
          padding: EdgeInsets.fromLTRB(20, 10, 20, 10),
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    GestureDetector(
                      onTap: () {
                        setState(() {
                          normalCont = true;
                          premiumCont = false;
                        });
                      },
                      child: Container(
                        height: 30.h,
                        width: 110.w,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(5),
                            color: normalCont
                                ? profileContainerColor
                                : moneyBox.withOpacity(0.2)),
                        child: Center(
                          child: Text(
                            'Normal Player',
                            style: TextStyle(color: titleText, fontSize: 11.sp),
                          ),
                        ),
                      ),
                    ),
                    GestureDetector(
                      onTap: () {
                        setState(() {
                          normalCont = false;
                          premiumCont = true;
                        });
                      },
                      child: Container(
                        height: 30.h,
                        width: 110.w,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(5),
                            color: premiumCont
                                ? profileContainerColor
                                : moneyBox.withOpacity(0.2)),
                        child: Center(
                          child: Text(
                            'Premium Player',
                            style: TextStyle(color: titleText, fontSize: 11.sp),
                          ),
                        ),
                      ),
                    )
                  ],
                ),
              ),
              filterBar(item),
              Container(
                height: 180.h,
                width: 260.w,
                child: ListView.builder(
                  shrinkWrap: true,
                  itemCount: _searchByService.playerListDisplay.length,
                  itemBuilder: (context, index) {
                    buttonMsg =
                        _searchByService.playerListDisplay[index].status == null
                            ? "Request"
                            : _searchByService
                                        .playerListDisplay[index].status ==
                                    "Join"
                                ? "Joined"
                                : "Pending";
                    buttonCol =
                        _searchByService.playerListDisplay[index].status == null
                            ? _searchByService.statusColor[0]
                            : _searchByService.playerListDisplay[index].status
                                        .toString() ==
                                    'pending'
                                ? _searchByService.statusColor[2]
                                : _searchByService.statusColor[1];
                    return Container(
                      margin: EdgeInsets.only(top: 10.h),
                      child: Center(
                        child: Stack(
                          children: [
                            Container(
                              height: 100.h,
                              // width: 300.w,
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
                                        backgroundImage: _searchByService
                                                    .playerListDisplay[index]
                                                    .photo
                                                    ?.isNotEmpty ??
                                                false
                                            ? CachedNetworkImageProvider(
                                                _searchByService
                                                    .playerListDisplay[index]
                                                    .photo?[0]?["url"])
                                            : CachedNetworkImageProvider(''),
                                      ),
                                    ),
                                    Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Container(
                                          // width: 170.w,
                                          child: Text(
                                            _searchByService
                                                    .playerListDisplay[index]
                                                    .firstName! +
                                                " " +
                                                _searchByService
                                                    .playerListDisplay[index]
                                                    .lastName!,
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
                                      ],
                                    ),
                                    Expanded(
                                      child: Container(),
                                    ),
                                    Container(
                                      margin: EdgeInsets.only(right: 10),
                                      child: Row(
                                        children: [
                                          _searchByService
                                                      .playerListDisplay[index]
                                                      .status ==
                                                  'pending'
                                              ? GestureDetector(
                                                  child: Container(
                                                    margin: EdgeInsets.only(
                                                        left: 10),
                                                    child: Image.asset(
                                                      "assets/images/teamListDelete.webp",
                                                      height: 15,
                                                    ),
                                                  ),
                                                  onTap: () async {
                                                    bool success =
                                                        await _searchByService
                                                            .cancelPlayerRequest(
                                                                _searchByService
                                                                    .playerListDisplay[
                                                                        index]
                                                                    .id);

                                                    if (success) {
                                                      setState(() {
                                                        _searchByService
                                                            .playerListDisplay[
                                                                index]
                                                            .status = null;
                                                        _searchByService
                                                            .playerListDisplay[
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
                                                    EdgeInsets.only(left: 5),
                                                child: Image.asset(
                                                  "assets/images/teamListInfo.webp",
                                                  height: 15,
                                                ),
                                              ),
                                              onTap: () {
                                                Get.find<
                                                        OtherPlayerInfoController>()
                                                    .getProfileData(
                                                        _searchByService
                                                            .playerListDisplay[
                                                                index]
                                                            .id
                                                            .toString());
                                              }),
                                        ],
                                      ),
                                    )
                                  ],
                                ),
                              ),
                            ),
                            _searchByService.userType == "Ground"
                                ? SizedBox()
                                : Positioned(
                                    right: 15.w,
                                    bottom: 10.h,
                                    child: GestureDetector(
                                      onTap: () {
                                        if (!_searchByService
                                            .playerListDisplay[index]
                                            .isJoined!) {
                                          _searchByService.requestPlayer(
                                              _searchByService
                                                  .playerListDisplay[index].id,
                                              index);
                                        } else {
                                          Utility.showSnackbar(AppLocalizations
                                                  .of(context)!
                                              .registeredTeamsPage_alreadyPresentSnackbar);
                                        }
                                      },
                                      child: Container(
                                        width: 80.w,
                                        height: 25.h,
                                        decoration: BoxDecoration(
                                          color: _searchByService
                                                      .playerListDisplay[index]
                                                      .isJoined ==
                                                  true
                                              ? _searchByService.statusColor[0]
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
                                                    fontWeight: FontWeight.bold,
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
              ),
              normalCont ? NormalPlayer() : PremiumPlayer()
            ],
          ),
        ),
      ),
    );
  }

  // Widget normalPlayerWidget(_searchByService) {
  //   String buttonMsg;
  //   Color buttonCol;

  //   return Container(
  //     height: 180.h,
  //     width: 260.w,
  //     child: ListView.builder(
  //       shrinkWrap: true,
  //       itemCount: _searchByService.playerListDisplay.length,
  //       itemBuilder: (context, index) {
  //         buttonMsg = _searchByService.playerListDisplay[index].status == null
  //             ? "Request"
  //             : _searchByService.playerListDisplay[index].status == "Join"
  //                 ? "Joined"
  //                 : "Pending";
  //         buttonCol = _searchByService.playerListDisplay[index].status == null
  //             ? _searchByService.statusColor[0]
  //             : _searchByService.playerListDisplay[index].status.toString() ==
  //                     'pending'
  //                 ? _searchByService.statusColor[2]
  //                 : _searchByService.statusColor[1];
  //         return Container(
  //           margin: EdgeInsets.only(top: 10.h),
  //           child: Center(
  //             child: Stack(
  //               children: [
  //                 Container(
  //                   height: 100.h,
  //                   // width: 300.w,
  //                   child: Card(
  //                     shape: RoundedRectangleBorder(
  //                         borderRadius: BorderRadius.circular(2.5.w)),
  //                     elevation: 3,
  //                     margin: EdgeInsets.fromLTRB(5.w, 0, 5.w, 25.h),
  //                     child: Row(
  //                       children: [
  //                         Container(
  //                           margin: EdgeInsets.symmetric(
  //                               vertical: 5.h, horizontal: 10),
  //                           child: CircleAvatar(
  //                             radius: 24.h,
  //                             backgroundImage: _searchByService
  //                                         .playerListDisplay[index]
  //                                         .photo
  //                                         ?.isNotEmpty ??
  //                                     false
  //                                 ? NetworkImage(_searchByService
  //                                     .playerListDisplay[index]
  //                                     .photo?[0]?["url"])
  //                                 : NetworkImage(''),
  //                           ),
  //                         ),
  //                         Column(
  //                           mainAxisAlignment: MainAxisAlignment.center,
  //                           crossAxisAlignment: CrossAxisAlignment.start,
  //                           children: [
  //                             Container(
  //                               // width: 170.w,
  //                               child: Text(
  //                                 _searchByService
  //                                         .playerListDisplay[index].firstName! +
  //                                     " " +
  //                                     _searchByService
  //                                         .playerListDisplay[index].lastName!,
  //                                 maxLines: 2,
  //                                 overflow: TextOverflow.ellipsis,
  //                                 style:
  //                                     themeData().textTheme.bodyText1!.copyWith(
  //                                           fontSize: 12.sp,
  //                                           fontWeight: FontWeight.bold,
  //                                           color: KRed,
  //                                         ),
  //                               ),
  //                             ),
  //                           ],
  //                         ),
  //                         Expanded(
  //                           child: Container(),
  //                         ),
  //                         Container(
  //                           margin: EdgeInsets.only(right: 10),
  //                           child: Row(
  //                             children: [
  //                               _searchByService
  //                                           .playerListDisplay[index].status ==
  //                                       'pending'
  //                                   ? GestureDetector(
  //                                       child: Container(
  //                                         margin: EdgeInsets.only(left: 10),
  //                                         child: Image.asset(
  //                                           "assets/images/teamListDelete.webp",
  //                                           height: 15,
  //                                         ),
  //                                       ),
  //                                       onTap: () async {
  //                                         bool success = await _searchByService
  //                                             .cancelPlayerRequest(
  //                                                 _searchByService
  //                                                     .playerListDisplay[index]
  //                                                     .id);

  //                                         if (success) {
  //                                           setState(() {
  //                                             _searchByService
  //                                                 .playerListDisplay[index]
  //                                                 .status = null;
  //                                             _searchByService
  //                                                 .playerListDisplay[index]
  //                                                 .isJoined = false;
  //                                           });
  //                                         }
  //                                       },
  //                                     )
  //                                   : SizedBox(),
  //                               GestureDetector(
  //                                   child: Container(
  //                                     padding: EdgeInsets.only(left: 5),
  //                                     child: Image.asset(
  //                                       "assets/images/teamListInfo.webp",
  //                                       height: 15,
  //                                     ),
  //                                   ),
  //                                   onTap: () {
  //                                     Get.find<OtherPlayerInfoController>()
  //                                         .getProfileData(_searchByService
  //                                             .playerListDisplay[index].id
  //                                             .toString());
  //                                   }),
  //                             ],
  //                           ),
  //                         )
  //                       ],
  //                     ),
  //                   ),
  //                 ),
  //                 _searchByService.userType == "Ground"
  //                     ? SizedBox()
  //                     : Positioned(
  //                         right: 15.w,
  //                         bottom: 10.h,
  //                         child: GestureDetector(
  //                           onTap: () {
  //                             if (!_searchByService
  //                                 .playerListDisplay[index].isJoined!) {
  //                               _searchByService.requestPlayer(
  //                                   _searchByService
  //                                       .playerListDisplay[index].id,
  //                                   index);
  //                             } else {
  //                               Utility.showSnackbar(AppLocalizations.of(
  //                                       context)!
  //                                   .registeredTeamsPage_alreadyPresentSnackbar);
  //                             }
  //                           },
  //                           child: Container(
  //                             width: 80.w,
  //                             height: 25.h,
  //                             decoration: BoxDecoration(
  //                               color: _searchByService.playerListDisplay[index]
  //                                           .isJoined ==
  //                                       true
  //                                   ? _searchByService.statusColor[0]
  //                                   : buttonCol,
  //                               borderRadius: BorderRadius.circular(2.5.w),
  //                             ),
  //                             child: Center(
  //                               child: Text(
  //                                 buttonMsg,
  //                                 style: themeData()
  //                                     .textTheme
  //                                     .bodyText1!
  //                                     .copyWith(
  //                                         fontSize: 12.sp,
  //                                         fontWeight: FontWeight.bold,
  //                                         color: Colors.white),
  //                               ),
  //                             ),
  //                           ),
  //                         ),
  //                       )
  //               ],
  //             ),
  //           ),
  //         );
  //       },
  //     ),
  //   );
  // }

  // Widget premiumPlayerWidget(_searchByService) {
  //   String buttonMsg;
  //   Color buttonCol;
  //   return Container(
  //     child: Text("data"),
  //   );
  //   // return Container(
  //   //   height: 180.h,
  //   //   width: 260.w,
  //   //   child: ListView.builder(
  //   //     shrinkWrap: true,
  //   //     itemCount: _searchByService.playerListDisplay.length,
  //   //     itemBuilder: (context, index) {
  //   //       buttonMsg = _searchByService.playerListDisplay[index].status == null
  //   //           ? "Request"
  //   //           : _searchByService.playerListDisplay[index].status == "Join"
  //   //               ? "Joined"
  //   //               : "Pending";
  //   //       buttonCol = _searchByService.playerListDisplay[index].status == null
  //   //           ? _searchByService.statusColor[0]
  //   //           : _searchByService.playerListDisplay[index].status.toString() ==
  //   //                   'pending'
  //   //               ? _searchByService.statusColor[2]
  //   //               : _searchByService.statusColor[1];
  //   //       return Container(
  //   //         margin: EdgeInsets.only(top: 10.h),
  //   //         child: Center(
  //   //           child: Stack(
  //   //             children: [
  //   //               Container(
  //   //                 height: 100.h,
  //   //                 // width: 300.w,
  //   //                 child: Card(
  //   //                   shape: RoundedRectangleBorder(
  //   //                       borderRadius: BorderRadius.circular(2.5.w)),
  //   //                   elevation: 3,
  //   //                   margin: EdgeInsets.fromLTRB(5.w, 0, 5.w, 25.h),
  //   //                   child: Row(
  //   //                     children: [
  //   //                       Container(
  //   //                         margin: EdgeInsets.symmetric(
  //   //                             vertical: 5.h, horizontal: 10),
  //   //                         child: CircleAvatar(
  //   //                           radius: 24.h,
  //   //                           backgroundImage: _searchByService
  //   //                                       .playerListDisplay[index]
  //   //                                       .photo
  //   //                                       ?.isNotEmpty ??
  //   //                                   false
  //   //                               ? NetworkImage(_searchByService
  //   //                                   .playerListDisplay[index]
  //   //                                   .photo?[0]?["url"])
  //   //                               : NetworkImage(''),
  //   //                         ),
  //   //                       ),
  //   //                       Column(
  //   //                         mainAxisAlignment: MainAxisAlignment.center,
  //   //                         crossAxisAlignment: CrossAxisAlignment.start,
  //   //                         children: [
  //   //                           Container(
  //   //                             // width: 170.w,
  //   //                             child: Text(
  //   //                               _searchByService
  //   //                                       .playerListDisplay[index].firstName! +
  //   //                                   " " +
  //   //                                   _searchByService
  //   //                                       .playerListDisplay[index].lastName!,
  //   //                               maxLines: 2,
  //   //                               overflow: TextOverflow.ellipsis,
  //   //                               style:
  //   //                                   themeData().textTheme.bodyText1!.copyWith(
  //   //                                         fontSize: 12.sp,
  //   //                                         fontWeight: FontWeight.bold,
  //   //                                         color: KRed,
  //   //                                       ),
  //   //                             ),
  //   //                           ),
  //   //                         ],
  //   //                       ),
  //   //                       Expanded(
  //   //                         child: Container(),
  //   //                       ),
  //   //                       Container(
  //   //                         margin: EdgeInsets.only(right: 10),
  //   //                         child: Row(
  //   //                           children: [
  //   //                             _searchByService
  //   //                                         .playerListDisplay[index].status ==
  //   //                                     'pending'
  //   //                                 ? GestureDetector(
  //   //                                     child: Container(
  //   //                                       margin: EdgeInsets.only(left: 10),
  //   //                                       child: Image.asset(
  //   //                                         "assets/images/teamListDelete.webp",
  //   //                                         height: 15,
  //   //                                       ),
  //   //                                     ),
  //   //                                     onTap: () async {
  //   //                                       bool success = await _searchByService
  //   //                                           .cancelPlayerRequest(
  //   //                                               _searchByService
  //   //                                                   .playerListDisplay[index]
  //   //                                                   .id);

  //   //                                       if (success) {
  //   //                                         setState(() {
  //   //                                           _searchByService
  //   //                                               .playerListDisplay[index]
  //   //                                               .status = null;
  //   //                                           _searchByService
  //   //                                               .playerListDisplay[index]
  //   //                                               .isJoined = false;
  //   //                                         });
  //   //                                       }
  //   //                                     },
  //   //                                   )
  //   //                                 : SizedBox(),
  //   //                             GestureDetector(
  //   //                                 child: Container(
  //   //                                   padding: EdgeInsets.only(left: 5),
  //   //                                   child: Image.asset(
  //   //                                     "assets/images/teamListInfo.webp",
  //   //                                     height: 15,
  //   //                                   ),
  //   //                                 ),
  //   //                                 onTap: () {
  //   //                                   Get.find<OtherPlayerInfoController>()
  //   //                                       .getProfileData(_searchByService
  //   //                                           .playerListDisplay[index].id
  //   //                                           .toString());
  //   //                                 }),
  //   //                           ],
  //   //                         ),
  //   //                       )
  //   //                     ],
  //   //                   ),
  //   //                 ),
  //   //               ),
  //   //               _searchByService.userType == "Ground"
  //   //                   ? SizedBox()
  //   //                   : Positioned(
  //   //                       right: 15.w,
  //   //                       bottom: 10.h,
  //   //                       child: GestureDetector(
  //   //                         onTap: () {
  //   //                           if (!_searchByService
  //   //                               .playerListDisplay[index].isJoined!) {
  //   //                             _searchByService.requestPlayer(
  //   //                                 _searchByService
  //   //                                     .playerListDisplay[index].id,
  //   //                                 index);
  //   //                           } else {
  //   //                             Utility.showSnackbar(AppLocalizations.of(
  //   //                                     context)!
  //   //                                 .registeredTeamsPage_alreadyPresentSnackbar);
  //   //                           }
  //   //                         },
  //   //                         child: Container(
  //   //                           width: 80.w,
  //   //                           height: 25.h,
  //   //                           decoration: BoxDecoration(
  //   //                             color: _searchByService.playerListDisplay[index]
  //   //                                         .isJoined ==
  //   //                                     true
  //   //                                 ? _searchByService.statusColor[0]
  //   //                                 : buttonCol,
  //   //                             borderRadius: BorderRadius.circular(2.5.w),
  //   //                           ),
  //   //                           child: Center(
  //   //                             child: Text(
  //   //                               buttonMsg,
  //   //                               style: themeData()
  //   //                                   .textTheme
  //   //                                   .bodyText1!
  //   //                                   .copyWith(
  //   //                                       fontSize: 12.sp,
  //   //                                       fontWeight: FontWeight.bold,
  //   //                                       color: Colors.white),
  //   //                             ),
  //   //                           ),
  //   //                         ),
  //   //                       ),
  //   //                     )
  //   //             ],
  //   //           ),
  //   //         ),
  //   //       );
  //   //     },
  //   //   ),
  //   // );
  // }

  Widget searchBar(_searchByService) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15),
      child: Container(
        child: TextFormField(
          onChanged: (value) {
            String text = value.toLowerCase();
            setState(() {
              if (playerCont) {
                _searchByService.playerListDisplay =
                    _searchByService.playerList.where((element) {
                  PlayerData player = element;
                  var playerTitle =
                      player.toJson()["first_name"]?.toLowerCase();
                  var playerLastName =
                      player.toJson()["last_name"]?.toLowerCase();
                  return playerTitle.contains(text) ||
                      playerLastName.contains(text);
                }).toList();
              }
              print("SEARCH FIELD $value");
              searchSlug = value.toLowerCase();
            });
          },
          decoration: InputDecoration(
            hintText: 'Enter Search here',
            hintStyle: themeData().textTheme.bodyText2!.copyWith(
                  color: labelText,
                  fontSize: 10.sp,
                ),
            suffixIcon: IconButton(
              onPressed: () {},
              icon: Icon(Icons.search),
            ),
          ),
        ),
      ),
    );
  }

  Widget filterBar(String term) {
    return ClipRect(
      child: Container(
        decoration: BoxDecoration(
            color: Colors.white, borderRadius: BorderRadius.circular(3)),
        margin: EdgeInsets.only(bottom: 12.h, left: 5.w, right: 5.w),
        height: 40.h,
        width: 250.w,
        child: Center(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Center(
                  child: Text(
                    term == '' ? 'Search term will display here' : term,
                    style: themeData()
                        .textTheme
                        .bodyText1!
                        .copyWith(fontSize: 12.sp, color: KLightGrey),
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
                Builder(builder: (context) {
                  return Center(
                    child: GestureDetector(
                      onTap: () {
                        Scaffold.of(context).openDrawer();
                      },
                      child: Image.asset(
                        'assets/images/filterIcon.webp',
                        width: 20.w,
                        height: 20.h,
                      ),
                    ),
                  );
                })
              ],
            ),
          ),
        ),
      ),
    );
  }
}
