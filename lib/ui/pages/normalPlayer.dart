import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:vamos/core/service/controller/otherPlayerInfoController.dart';
import 'package:vamos/core/service/controller/playerListingController.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:vamos/ui/utils/color.dart';
import 'package:vamos/ui/utils/theme.dart';
import 'package:vamos/ui/utils/utility.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class NormalPlayer extends StatefulWidget {
  const NormalPlayer({Key? key}) : super(key: key);

  @override
  _NormalPlayerState createState() => _NormalPlayerState();
}

class _NormalPlayerState extends State<NormalPlayer> {
  @override
  void initState() {
    // TODO: implement initState

    WidgetsBinding.instance!.addPostFrameCallback(
        (_) => Get.find<PlayerListController>().searchPlayerlist(0));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    String buttonMsg;
    Color buttonCol;
    return GetBuilder<PlayerListController>(
        builder: (_searchByService) => Container(
              height: 180.h,
              width: 260.w,
              child: ListView.builder(
                shrinkWrap: true,
                itemCount: _searchByService.playerListDisplay.length,
                itemBuilder: (context, index) {
                  buttonMsg =
                      _searchByService.playerListDisplay[index].status == null
                          ? "Request"
                          : _searchByService.playerListDisplay[index].status ==
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
                                          ? NetworkImage(_searchByService
                                              .playerListDisplay[index]
                                              .photo?[0]?["url"])
                                          : NetworkImage(''),
                                    ),
                                  ),
                                  Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
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
                                                  margin:
                                                      EdgeInsets.only(left: 10),
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
                                              padding: EdgeInsets.only(left: 5),
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
                                          .playerListDisplay[index].isJoined!) {
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
            ));
  }
}
