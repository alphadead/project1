import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/src/simple/get_state.dart';
import 'package:vamos/core/service/controller/authController.dart';
import 'package:vamos/core/service/controller/profileController.dart';
import 'package:vamos/widget/profileContainer.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:vamos/widget/radioWidget.dart';

class PositionRadioList extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    WidgetsBinding.instance!.addPostFrameCallback((_) {
      Get.find<AuthController>().position =
          Get.find<ProfileController>().profile?.position ?? "Goal Keeper";
    });
    return GetBuilder<AuthController>(
      builder: (_authService) => Container(
        padding: EdgeInsets.only(top: 30),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ProfileContainer(
                title: AppLocalizations.of(context)!.profilePage_position),
            radioWidget("Goal Keeper", _authService.position, (String? value) {
              _authService.position = value!;
            }),
            radioWidget("Defender", _authService.position, (String? value) {
              _authService.position = value!;
            }),
            radioWidget("Mid Fielder", _authService.position, (String? value) {
              _authService.position = value!;
            }),
            radioWidget("Attacker", _authService.position, (String? value) {
              _authService.position = value!;
            })
          ],
        ),
      ),
    );
  }
}
