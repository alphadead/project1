import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:vamos/core/service/controller/authController.dart';
import 'package:vamos/core/service/controller/profileController.dart';
import 'package:vamos/widget/inputField.dart';
import 'package:vamos/widget/profileContainer.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class NickName extends StatefulWidget {
  const NickName({Key? key}) : super(key: key);

  @override
  _NickNameState createState() => _NickNameState();
}

class _NickNameState extends State<NickName> {
  String? _text;

  TextEditingController nickNameController = TextEditingController();

  @override
  void initState() {
    super.initState();

    WidgetsBinding.instance!.addPostFrameCallback((_) => setState(() {
          _text = Get.find<ProfileController>().profile?.nick_name;
          if (_text != null) {
            Get.find<AuthController>().nickName = _text;
            nickNameController.text = _text ?? "";
          }
        }));
  }

  @override
  Widget build(BuildContext context) {
    return GetBuilder<AuthController>(builder: (_authService) {
      return Container(
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
                child: inputField(null, (value) {
                  _authService.nickName = value;
                },
                    initialValue: _authService.nickName,
                    controller: nickNameController),
              ),
            )
          ],
        ),
      );
    });
  }
}
