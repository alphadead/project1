import 'package:flutter/material.dart';
import 'package:get/get_state_manager/src/simple/get_state.dart';
import 'package:vamos/core/service/controller/authController.dart';
import 'package:vamos/ui/utils/color.dart';
import 'package:vamos/widget/profileContainer.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

enum positionenum { goalkeeper, defender, midfielder, attacker }

const positionValues = {
  positionenum.attacker: "Attacker",
  positionenum.goalkeeper: "Goal Keeper",
  positionenum.midfielder: "Mid Fielder",
  positionenum.defender: "Defender",
};

class PositionRadioList extends StatefulWidget {
  const PositionRadioList({Key? key}) : super(key: key);

  @override
  _PositionRadioListState createState() => _PositionRadioListState();
}

class _PositionRadioListState extends State<PositionRadioList> {
  positionenum? _position;

  @override
  Widget build(BuildContext context) {
    return GetBuilder<AuthController>(
      builder: (_authService) => Container(
        padding: EdgeInsets.only(top: 30),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ProfileContainer(
                title: AppLocalizations.of(context)!.profilePage_position),
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
                      value: positionenum.goalkeeper,
                      groupValue: _position,
                      onChanged: (positionenum? value) {
                        setState(() {
                          _position = value;
                          _authService.position =
                              positionValues[_position].toString();
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
                      value: positionenum.defender,
                      groupValue: _position,
                      onChanged: (positionenum? value) {
                        setState(() {
                          _position = value;
                          _authService.position =
                              positionValues[_position].toString();
                        });
                      },
                    ),
                  ),
                  Text(
                    AppLocalizations.of(context)!.profilePage_defender,
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
                      value: positionenum.midfielder,
                      groupValue: _position,
                      onChanged: (positionenum? value) {
                        setState(() {
                          _position = value;
                          _authService.position =
                              positionValues[_position].toString();
                        });
                      },
                    ),
                  ),
                  Text(
                    AppLocalizations.of(context)!.profilePage_midfielder,
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
                      value: positionenum.attacker,
                      groupValue: _position,
                      onChanged: (positionenum? value) {
                        setState(() {
                          _position = value;
                          _authService.position =
                              positionValues[_position].toString();
                        });
                      },
                    ),
                  ),
                  Text(
                    AppLocalizations.of(context)!.profilePage_attacker,
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
