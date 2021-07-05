import 'package:flutter/material.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:vamos/core/service/controller/authController.dart';
import 'package:vamos/ui/utils/color.dart';
import 'package:vamos/widget/numvalueContainer.dart';
import 'package:vamos/widget/profileContainer.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ProfilePhoto extends StatefulWidget {
  const ProfilePhoto({Key? key}) : super(key: key);

  @override
  _ProfilePhotoState createState() => _ProfilePhotoState();
}

class _ProfilePhotoState extends State<ProfilePhoto> {
  @override
  Widget build(BuildContext context) {
    return GetBuilder<AuthController>(
        builder: (_authService) => Container(
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
            ));
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
    return GetBuilder<AuthController>(
        builder: (_authService) => Container(
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
            ));
  }
}
