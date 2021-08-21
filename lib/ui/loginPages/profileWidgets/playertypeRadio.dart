import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:vamos/core/service/controller/authController.dart';
import 'package:vamos/core/service/controller/profileController.dart';
import 'package:vamos/widget/profileContainer.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:vamos/widget/radioWidget.dart';

class PlayerTypeRadioList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    WidgetsBinding.instance!.addPostFrameCallback((_) {
      Get.find<AuthController>().typeOfPlayer =
          Get.find<ProfileController>().profile?.type_of_player ?? "Player";
    });
    return GetBuilder<AuthController>(
      builder: (_authService) => Container(
        padding: EdgeInsets.only(top: 30),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ProfileContainer(
                title: AppLocalizations.of(context)!.profilePage_typeOfPlayer),
            radioWidget("Player", _authService.typeOfPlayer, (String? value) {
              _authService.typeOfPlayer = value!;
            }),
            radioWidget("Goal Keeper", _authService.typeOfPlayer,
                (String? value) {
              _authService.typeOfPlayer = value!;
            }),
            radioWidget("Refree", _authService.typeOfPlayer, (String? value) {
              _authService.typeOfPlayer = value!;
            }),
            radioWidget("Football Photographer", _authService.typeOfPlayer,
                (String? value) {
              _authService.typeOfPlayer = value!;
            })
          ],
        ),
      ),
    );
  }
}
