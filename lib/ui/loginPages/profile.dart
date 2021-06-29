import 'package:flutter/material.dart';
import 'package:vamos/ui/utils/color.dart';
import 'package:vamos/ui/utils/loginbkground.dart';
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
        backgroundColor: Colors.white,
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
                    FitnessDetail(),
                    Nationality(),
                    ProfilePhoto(),
                    SkillVideo(),
                    Center(
                      child: GestureDetector(
                        onTap: () {},
                        child: Container(
                          width: 250.h,
                          height: 40.w,
                          child: Center(
                            child: Text(
                              'View Profile',
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 15,
                                color: Colors.white,
                              ),
                            ),
                          ),
                          decoration: BoxDecoration(
                            color: Color.fromRGBO(239, 77, 35, 1),
                            //(#ef4d23),
                            borderRadius: BorderRadius.circular(30),
                          ),
                        ),
                      ),
                    )
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

class FitnessDetail extends StatefulWidget {
  const FitnessDetail({Key? key}) : super(key: key);

  @override
  _FitnessDetailState createState() => _FitnessDetailState();
}

class _FitnessDetailState extends State<FitnessDetail> {
  double sliderVal = 180;
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(top: 30),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ProfileContainer(title: "Fitness Detail"),
          Container(
            padding: EdgeInsets.fromLTRB(30, 15, 0, 0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [],
                    ),
                    Text(
                      "Height",
                      style: TextStyle(color: inputText, fontSize: 18.h),
                    ),
                    SizedBox(
                      height: 2.h,
                    ),
                    Container(
                      padding: EdgeInsets.all(10),
                      height: 85.h,
                      width: 285.w,
                      color: Color.fromRGBO(249, 249, 249, 1),
                      child: Column(
                        children: [
                          Text(
                            "$sliderVal" + " cm",
                            style: TextStyle(
                                color: headAndIcon,
                                fontSize: 20,
                                fontWeight: FontWeight.w900),
                          ),
                          SliderTheme(
                            data: SliderThemeData(
                              activeTrackColor: inputText,
                              inactiveTrackColor: Colors.lightGreen,
                              thumbColor: Color.fromRGBO(239, 77, 35, 1),
                            ),
                            child: Slider(
                              min: 0,
                              max: 300,
                              divisions: 300,
                              value: sliderVal,
                              onChanged: (val) {
                                setState(() {
                                  sliderVal = val;
                                });
                              },
                            ),
                          ),
                        ],
                      ),
                    )
                  ],
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}

class Nationality extends StatefulWidget {
  const Nationality({Key? key}) : super(key: key);

  @override
  _NationalityState createState() => _NationalityState();
}

class _NationalityState extends State<Nationality> {
  String dropdownValue = 'India';
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(top: 30),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ProfileContainer(title: "Nationality"),
          Container(
            padding: EdgeInsets.fromLTRB(30, 15, 0, 0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Container(
                  padding: EdgeInsets.all(12),
                  color: Color.fromRGBO(249, 249, 249, 1),
                  width: 285.w,
                  height: 41.h,
                  child: DropdownButton<String>(
                    underline: Container(
                      height: 0,
                      color: Colors.transparent,
                    ),
                    value: dropdownValue,
                    onChanged: (String? newValue) {
                      setState(() {
                        dropdownValue = newValue!;
                      });
                    },
                    items: <String>['Florida', 'India', 'England', 'Santorini']
                        .map<DropdownMenuItem<String>>((String value) {
                      return DropdownMenuItem<String>(
                        value: value,
                        child: Text(
                          value,
                          style: TextStyle(color: inputText, fontSize: 16),
                        ),
                      );
                    }).toList(),
                  ),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}

class ProfilePhoto extends StatefulWidget {
  const ProfilePhoto({Key? key}) : super(key: key);

  @override
  _ProfilePhotoState createState() => _ProfilePhotoState();
}

class _ProfilePhotoState extends State<ProfilePhoto> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(top: 30),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ProfileContainer(title: "Profile Photo"),
          Container(
            padding: EdgeInsets.fromLTRB(30.w, 15, 0, 0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Container(
                  height: 86.h,
                  width: 130.w,
                  color: Color.fromRGBO(249, 249, 249, 1),
                  child: Center(
                      child: Image.asset(
                    "assets/images/add_image_1.webp",
                    height: 28.h,
                    width: 34.w,
                  )),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}

class SkillVideo extends StatefulWidget {
  const SkillVideo({Key? key}) : super(key: key);

  @override
  _SkillVideoState createState() => _SkillVideoState();
}

class _SkillVideoState extends State<SkillVideo> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(top: 30),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ProfileContainer(title: "Skill Videos"),
          Container(
            padding: EdgeInsets.fromLTRB(10.w, 15, 30, 30),
            child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Container(
                    height: 86.h,
                    width: 130.w,
                    color: Color.fromRGBO(249, 249, 249, 1),
                    child: Center(
                        child: Image.asset(
                      "assets/images/add_video_copy.webp",
                      height: 28.h,
                      width: 34.w,
                    )),
                  ),
                  Container(
                    height: 86.h,
                    width: 130.w,
                    color: Color.fromRGBO(249, 249, 249, 1),
                    child: Center(
                        child: Image.asset(
                      "assets/images/add_video_copy.webp",
                      height: 28.h,
                      width: 34.w,
                    )),
                  ),
                ]),
          ),
        ],
      ),
    );
  }
}
