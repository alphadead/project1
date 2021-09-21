import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:vamos/core/service/controller/otherPlayerInfoController.dart';
import 'package:vamos/core/service/controller/playerListingController.dart';
import 'package:vamos/ui/pages/profileInformation/otherPlayerProfile.dart';
import 'package:vamos/ui/utils/color.dart';
import 'package:vamos/ui/utils/theme.dart';
import 'package:vamos/ui/utils/utility.dart';
import 'package:vamos/widget/formWidgets/buttons.dart';
import 'package:vamos/widget/customAppBar.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:vamos/widget/customBottomNavBar.dart';

class PlayerListScreen extends StatefulWidget {
  const PlayerListScreen({Key? key}) : super(key: key);

  @override
  _PlayerListScreenState createState() => _PlayerListScreenState();
}

class _PlayerListScreenState extends State<PlayerListScreen> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    String buttonMsg;
    Color buttonCol;
    return SafeArea(
      child: GetBuilder<PlayerListController>(
        builder: (_playerListController) => Directionality(
          textDirection: TextDirection.ltr,
          child: Scaffold(
            resizeToAvoidBottomInset: false,
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
                  Center(
                    child: Container(
                      margin: EdgeInsets.symmetric(vertical: 20.h),
                      child: Column(
                        children: [
                          Container(
                            margin: EdgeInsets.only(bottom: 10.h),
                            height: 56.h,
                            child: Image.asset("assets/images/team_logo.webp"),
                          ),
                          Text(
                            "List of Players",
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
                  ListView.builder(
                    physics: NeverScrollableScrollPhysics(),
                    shrinkWrap: true,
                    itemCount: _playerListController.playerListDisplay.length,
                    itemBuilder: (context, index) {
                      buttonMsg = _playerListController
                                  .playerListDisplay[index].status ==
                              null
                          ? "Request"
                          : _playerListController
                                      .playerListDisplay[index].status ==
                                  "Join"
                              ? "Joined"
                              : "Pending";
                      buttonCol = _playerListController
                                  .playerListDisplay[index].status ==
                              null
                          ? _playerListController.statusColor[0]
                          : _playerListController
                                      .playerListDisplay[index].status
                                      .toString() ==
                                  'pending'
                              ? _playerListController.statusColor[2]
                              : _playerListController.statusColor[1];
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
                                  margin:
                                      EdgeInsets.fromLTRB(5.w, 0, 5.w, 25.h),
                                  child: Row(
                                    children: [
                                      Stack(children: [
                                        Container(
                                          margin: EdgeInsets.symmetric(
                                              vertical: 5.h, horizontal: 10),
                                          child: CircleAvatar(
                                            radius: 24.h,
                                            backgroundImage: _playerListController
                                                        .playerListDisplay[
                                                            index]
                                                        .photo
                                                        ?.isNotEmpty ??
                                                    false
                                                ? CachedNetworkImageProvider(
                                                    _playerListController
                                                        .playerListDisplay[
                                                            index]
                                                        .photo?[0]?["url"])
                                                : CachedNetworkImageProvider(
                                                    ''),
                                          ),
                                        ),
                                        _playerListController
                                                    .playerListDisplay[index]
                                                    .isPremium ==
                                                "1"
                                            ? Align(
                                                alignment:
                                                    Alignment.centerRight,
                                                child: Icon(
                                                  Icons.verified,
                                                  color: KColorAppBar,
                                                ),
                                              )
                                            : Align()
                                      ]),
                                      Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Container(
                                            width: 170.w,
                                            child: Text(
                                              _playerListController
                                                      .playerListDisplay[index]
                                                      .firstName! +
                                                  " " +
                                                  _playerListController
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
                                            _playerListController
                                                        .playerListDisplay[
                                                            index]
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
                                                      bool success = await _playerListController
                                                          .cancelPlayerRequest(
                                                              _playerListController
                                                                  .playerListDisplay[
                                                                      index]
                                                                  .id);

                                                      if (success) {
                                                        setState(() {
                                                          _playerListController
                                                              .playerListDisplay[
                                                                  index]
                                                              .status = null;
                                                          _playerListController
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
                                                        _playerListController
                                                            .playerListDisplay[
                                                                index]
                                                            .id
                                                            .toString());
                                              },
                                            ),
                                          ],
                                        ),
                                      )
                                    ],
                                  ),
                                ),
                              ),
                              _playerListController.userType == "Ground"
                                  ? SizedBox()
                                  : Positioned(
                                      right: 15.w,
                                      bottom: 10.h,
                                      child: GestureDetector(
                                        onTap: () {
                                          if (!_playerListController
                                              .playerListDisplay[index]
                                              .isJoined!) {
                                            _playerListController.requestPlayer(
                                                _playerListController
                                                    .playerListDisplay[index]
                                                    .id,
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
                                            color: _playerListController
                                                        .playerListDisplay[
                                                            index]
                                                        .isJoined ==
                                                    true
                                                ? _playerListController
                                                    .statusColor[0]
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
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
