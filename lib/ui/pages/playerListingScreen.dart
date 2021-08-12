import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:vamos/core/service/controller/playerListingController.dart';
import 'package:vamos/core/service/controller/teamListingController.dart';
import 'package:vamos/ui/utils/color.dart';
import 'package:vamos/ui/utils/loginbkground.dart';
import 'package:vamos/ui/utils/utility.dart';
import 'package:vamos/widget/customAppBar.dart';
import 'package:vamos/widget/customBottomNavBar.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:vamos/widget/registeredTeamCard.dart';
import 'package:vamos/widget/searchBar.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class PlayerListingScreen extends StatefulWidget {
  const PlayerListingScreen({Key? key}) : super(key: key);

  @override
  _PlayerListingScreenState createState() => _PlayerListingScreenState();
}

class _PlayerListingScreenState extends State<PlayerListingScreen> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: GetBuilder<PlayerListController>(
        builder: (_playerListController) => Directionality(
          textDirection: TextDirection.ltr,
          child: Scaffold(
            resizeToAvoidBottomInset: false,
            floatingActionButtonLocation:
                FloatingActionButtonLocation.miniCenterDocked,
            appBar: PreferredSize(
              preferredSize: Size.fromHeight(60.h),
              child: CustomAppBar(),
            ),
            body: SingleChildScrollView(
              child: Column(
                children: [
                  SizedBox(
                    height: 10.h,
                  ),
                  ListView.builder(
                    physics: NeverScrollableScrollPhysics(),
                    shrinkWrap: true,
                    itemCount:
                        _playerListController.playerListDisplay.length + 1,
                    itemBuilder: (context, index) {
                      return index == 0
                          ? searchBar(
                              context: context,
                              onchanged: (value) {
                                String text = value.toLowerCase();
                                setState(() {
                                  _playerListController.playerListDisplay =
                                      _playerListController.playerList
                                          .where((element) {
                                    var playerTitle =
                                        element.firstName!.toLowerCase();
                                    var playerLastName =
                                        element.lastName!.toLowerCase();
                                    return playerTitle.contains(text) ||
                                        playerLastName.contains(text);
                                  }).toList();
                                });
                              })
                          : listItem(
                              index - 1,
                              context,
                              _playerListController
                                  .playerListDisplay[index - 1], () {
                              if (!_playerListController
                                  .playerListDisplay[index - 1].isJoined!) {
                                _playerListController.requestPlayer(
                                    _playerListController
                                        .playerListDisplay[index - 1].id!);

                                setState(() {
                                  _playerListController
                                      .playerListDisplay[index - 1]
                                      .isJoined = true;
                                });
                              } else {
                                Utility.showSnackbar(AppLocalizations.of(
                                        context)!
                                    .registeredTeamsPage_alreadyPresentSnackbar);
                              }
                            },
                              _playerListController
                                  .playerListDisplay[index - 1].isJoined);
                    },
                  ),
                  Container(
                    padding: EdgeInsets.symmetric(vertical: 30),
                    child: primaryActionButton(
                        context: context,
                        onPressed: () {
                          Get.toNamed("/homeScreen");
                        }),
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget listItem(index, context, player, onPressed, pressed) {
    return ListTile(
        title: registeredTeamContainer(
            context: context,
            player: player,
            buttonText: AppLocalizations.of(context)!
                .playerListingPage_requestButtonText,
            onPressed: onPressed,
            pressed: pressed));
  }
}