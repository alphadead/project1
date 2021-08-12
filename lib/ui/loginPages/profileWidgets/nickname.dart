import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:vamos/core/service/controller/authController.dart';
import 'package:vamos/widget/inputField.dart';
import 'package:vamos/widget/profileContainer.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class NickName extends StatelessWidget {
  const NickName({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<AuthController>(
      builder: (_authService) => Container(
        padding: EdgeInsets.only(top: 30),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ProfileContainer(
                title: AppLocalizations.of(context)!.profilePage_nickname),
            Container(
              height: 50.h,
              width: 270.w,
              margin: EdgeInsets.fromLTRB(30, 15, 0, 0),
              child: Container(
                padding: EdgeInsets.all(12),
                color: Color.fromRGBO(249, 249, 249, 1),
                child: inputField(
                    AppLocalizations.of(context)!.profilePage_nicknamePrompt,
                    (value) {}),
              ),
            )
          ],
        ),
      ),
    );
  }
}
