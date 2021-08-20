import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:vamos/core/models/profileDataResponse.dart';
import 'package:vamos/core/service/controller/authController.dart';
import 'package:vamos/core/service/controller/profileController.dart';
import 'package:vamos/ui/utils/color.dart';
import 'package:vamos/widget/profileContainer.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

enum playerTypeenum { player, goalkeeper, refree, photographer }

const playerTypeValues = {
  playerTypeenum.player: "Player",
  playerTypeenum.goalkeeper: "Goal Keeper",
  playerTypeenum.refree: "Refree",
  playerTypeenum.photographer: "Football Photographer"
};

const playerTypeEnum = {
  "Player": playerTypeenum.player,
  "Goal Keeper": playerTypeenum.goalkeeper,
  "Refree": playerTypeenum.refree,
  "Football Photographer": playerTypeenum.photographer
};

class PlayerTypeRadioList extends StatefulWidget {
  ProfileData? type;
  PlayerTypeRadioList({Key? key, ProfileData? type}) : super(key: key);

  @override
  _PlayerTypeRadioListState createState() => _PlayerTypeRadioListState();
}

class _PlayerTypeRadioListState extends State<PlayerTypeRadioList> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance!.addPostFrameCallback((_) {
      _player =
          playerTypeEnum[Get.find<ProfileController>().profile?.type_of_player];
      Get.find<AuthController>().typeOfPlayer =
          playerTypeValues[_player].toString();
    });
  }

  playerTypeenum? _player;
  @override
  Widget build(BuildContext context) {
    return GetBuilder<AuthController>(
      builder: (_authService) => Container(
        padding: EdgeInsets.only(top: 30),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ProfileContainer(
                title: AppLocalizations.of(context)!.profilePage_typeOfPlayer),
            Container(
              padding: EdgeInsets.only(left: 10),
              child: Row(
                children: [
                  Transform.scale(
                    scale: 1.35,
                    child: Radio(
                      splashRadius: 15,
                      fillColor:
                          MaterialStateProperty.all(profileContainerColor),
                      value: playerTypeenum.player,
                      groupValue: _player,
                      onChanged: (playerTypeenum? value) {
                        setState(() {
                          _player = value;
                          _authService.typeOfPlayer =
                              playerTypeValues[_player].toString();
                        });
                      },
                    ),
                  ),
                  Text(
                    AppLocalizations.of(context)!.profilePage_player,
                    style: TextStyle(fontSize: 15, color: lightGrey),
                  )
                ],
              ),
            ),
            Container(
              padding: EdgeInsets.only(left: 10),
              child: Row(
                children: [
                  Transform.scale(
                    scale: 1.35,
                    child: Radio(
                      splashRadius: 10,
                      fillColor:
                          MaterialStateProperty.all(profileContainerColor),
                      value: playerTypeenum.goalkeeper,
                      groupValue: _player,
                      onChanged: (playerTypeenum? value) {
                        setState(() {
                          _player = value;
                          _authService.typeOfPlayer =
                              playerTypeValues[_player].toString();
                        });
                      },
                    ),
                  ),
                  Text(
                    AppLocalizations.of(context)!.profilePage_goalKeeper,
                    style: TextStyle(fontSize: 15, color: lightGrey),
                  )
                ],
              ),
            ),
            Container(
              padding: EdgeInsets.only(left: 10),
              child: Row(
                children: [
                  Transform.scale(
                    scale: 1.35,
                    child: Radio(
                      splashRadius: 15,
                      fillColor:
                          MaterialStateProperty.all(profileContainerColor),
                      value: playerTypeenum.refree,
                      groupValue: _player,
                      onChanged: (playerTypeenum? value) {
                        setState(() {
                          _player = value;
                          _authService.typeOfPlayer =
                              playerTypeValues[_player].toString();
                        });
                      },
                    ),
                  ),
                  Text(
                    AppLocalizations.of(context)!.profilePage_referee,
                    style: TextStyle(fontSize: 15, color: lightGrey),
                  )
                ],
              ),
            ),
            Container(
              padding: EdgeInsets.only(left: 10),
              child: Row(
                children: [
                  Transform.scale(
                    scale: 1.35,
                    child: Radio(
                      splashRadius: 15,
                      fillColor:
                          MaterialStateProperty.all(profileContainerColor),
                      value: playerTypeenum.photographer,
                      groupValue: _player,
                      onChanged: (playerTypeenum? value) {
                        setState(() {
                          _player = value;
                          _authService.typeOfPlayer =
                              playerTypeValues[_player].toString();
                        });
                      },
                    ),
                  ),
                  Text(
                    AppLocalizations.of(context)!.profilePage_footballPhoto,
                    style: TextStyle(fontSize: 15, color: lightGrey),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
