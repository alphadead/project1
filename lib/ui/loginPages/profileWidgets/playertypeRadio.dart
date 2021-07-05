import 'package:flutter/material.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:vamos/core/service/controller/authController.dart';
import 'package:vamos/ui/utils/color.dart';
import 'package:vamos/widget/profileContainer.dart';

enum playerTypeenum { player, goalkeeper, refree, photographer }

const playerTypeValues = {
  playerTypeenum.player: "Player",
  playerTypeenum.goalkeeper: "Goal Keeper",
  playerTypeenum.refree: "Refree",
  playerTypeenum.photographer: "Football Photographer"
};

class PlayerTypeRadioList extends StatefulWidget {
  const PlayerTypeRadioList({Key? key}) : super(key: key);

  @override
  _PlayerTypeRadioListState createState() => _PlayerTypeRadioListState();
}

class _PlayerTypeRadioListState extends State<PlayerTypeRadioList> {
  playerTypeenum? _player;
  @override
  Widget build(BuildContext context) {
    return GetBuilder<AuthController>(
      builder: (_authService) => Container(
        padding: EdgeInsets.only(top: 30),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ProfileContainer(title: "Type of Player"),
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
                    "Player",
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
                    "Goal Keeper",
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
                    "Referee",
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
                    "Football Photographer",
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
