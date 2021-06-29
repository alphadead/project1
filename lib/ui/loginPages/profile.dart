import 'package:flutter/material.dart';
import 'package:vamos/ui/utils/color.dart';
import 'package:vamos/ui/utils/theme.dart';
import 'package:vamos/widget/loginpageStack.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:vamos/widget/profileContainer.dart';

enum playerTypeenum { player, goalkeeper, refree, photographer }
enum positionenum { goalkeeper, defender, midfielder, attacker }

const playerTypeValues = {
  playerTypeenum.player: "Player",
  playerTypeenum.goalkeeper: "Goal Keeper",
  playerTypeenum.refree: "Refree",
  playerTypeenum.photographer: "Football Photographer"
};

const positionValues = {
  positionenum.attacker: "Attacker",
  positionenum.goalkeeper: "Goal Keeper",
  positionenum.midfielder: "Mid Fielder",
  positionenum.defender: "Defender",
};

class ProfilePage extends StatelessWidget {
  const ProfilePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              LoginPageStack(
                heading: "Profile",
                imageWidget: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Container(
                      height: 0.8.sh,
                      child: Image.asset(
                        'assets/images/register.png',
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                decoration: BoxDecoration(
                  border: Border.all(width: 0, color: Colors.white),
                ),
                margin: EdgeInsets.only(bottom: 10),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    PlayerTypeRadioList(),
                    PositionRadioList(),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class PlayerTypeRadioList extends StatefulWidget {
  const PlayerTypeRadioList({Key? key}) : super(key: key);

  @override
  _PlayerTypeRadioListState createState() => _PlayerTypeRadioListState();
}

class _PlayerTypeRadioListState extends State<PlayerTypeRadioList> {
  playerTypeenum? _player;
  @override
  Widget build(BuildContext context) {
    return Container(
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
                    fillColor: MaterialStateProperty.all(profileContainerColor),
                    value: playerTypeenum.player,
                    groupValue: _player,
                    onChanged: (playerTypeenum? value) {
                      setState(() {
                        _player = value;
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
                    fillColor: MaterialStateProperty.all(profileContainerColor),
                    value: playerTypeenum.goalkeeper,
                    groupValue: _player,
                    onChanged: (playerTypeenum? value) {
                      setState(() {
                        _player = value;
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
                    fillColor: MaterialStateProperty.all(profileContainerColor),
                    value: playerTypeenum.refree,
                    groupValue: _player,
                    onChanged: (playerTypeenum? value) {
                      setState(() {
                        _player = value;
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
                    fillColor: MaterialStateProperty.all(profileContainerColor),
                    value: playerTypeenum.photographer,
                    groupValue: _player,
                    onChanged: (playerTypeenum? value) {
                      setState(() {
                        _player = value;
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
    );
  }
}

class PositionRadioList extends StatefulWidget {
  const PositionRadioList({Key? key}) : super(key: key);

  @override
  _PositionRadioListState createState() => _PositionRadioListState();
}

class _PositionRadioListState extends State<PositionRadioList> {
  positionenum? _position;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(top: 30),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ProfileContainer(title: "Position"),
          Container(
            padding: EdgeInsets.only(left: 10),
            child: Row(
              children: [
                Transform.scale(
                  scale: 1.35,
                  child: Radio(
                    splashRadius: 15,
                    fillColor: MaterialStateProperty.all(profileContainerColor),
                    value: positionenum.goalkeeper,
                    groupValue: _position,
                    onChanged: (positionenum? value) {
                      setState(() {
                        _position = value;
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
                    fillColor: MaterialStateProperty.all(profileContainerColor),
                    value: positionenum.defender,
                    groupValue: _position,
                    onChanged: (positionenum? value) {
                      setState(() {
                        _position = value;
                      });
                    },
                  ),
                ),
                Text(
                  "Defender",
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
                    fillColor: MaterialStateProperty.all(profileContainerColor),
                    value: positionenum.midfielder,
                    groupValue: _position,
                    onChanged: (positionenum? value) {
                      setState(() {
                        _position = value;
                      });
                    },
                  ),
                ),
                Text(
                  "Mid Fielder",
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
                    fillColor: MaterialStateProperty.all(profileContainerColor),
                    value: positionenum.attacker,
                    groupValue: _position,
                    onChanged: (positionenum? value) {
                      setState(() {
                        _position = value;
                      });
                    },
                  ),
                ),
                Text(
                  "Attacker",
                  style: TextStyle(fontSize: 15, color: lightGrey),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
