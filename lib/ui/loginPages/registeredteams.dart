import 'package:flutter/material.dart';
import 'package:get/get_core/get_core.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:vamos/core/service/controller/authController.dart';
import 'package:vamos/ui/pages/inviteScreen.dart';
import 'package:vamos/ui/utils/color.dart';
import 'package:vamos/ui/utils/loginbkground.dart';
import 'package:vamos/widget/loginpageStack.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class RegisteredTeamPage extends StatelessWidget {
  const RegisteredTeamPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: GetBuilder<AuthController>(
      builder: (_authService) => Scaffold(
        body: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Container(
                child: Column(
                  children: [
                    LoginPageStack(
                      heading: "Registered Teams",
                      imageWidget: Positioned(
                        bottom: -50.h,
                        left: 120.w,
                        height: 330.h,
                        width: 330.w,
                        child: Image.asset(
                          'assets/images/group_3.png',
                        ),
                      ),
                    ),
                    Container(
                      height: 20,
                    ),
                    ListView.builder(
                      physics: NeverScrollableScrollPhysics(),
                      shrinkWrap: true,
                      itemCount: 7,
                      itemBuilder: (context, index) {
                        return ListTile(
                          title: RegisteredTeamContainer(),
                        );
                      },
                    ),
                    Container(
                      padding: EdgeInsets.symmetric(vertical: 30),
                      child: primaryActionButton(
                          context: context,
                          onPressed: () {
                            Get.toNamed("/inviteScreen");
                          }),
                    )
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    ));
  }
}

class RegisteredTeamContainer extends StatelessWidget {
  const RegisteredTeamContainer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: 12),
      child: Ink(
        width: 333.w,
        height: 65.h,
        decoration: BoxDecoration(
          color: containerGreen,
          borderRadius: BorderRadius.circular(2.5),
        ),
        child: Row(
          children: [
            Container(
              margin: EdgeInsets.symmetric(vertical: 5.h, horizontal: 10),
              child: Image.asset('assets/images/placeholder_team_icon.png'),
            ),
            Container(
              padding: EdgeInsets.only(left: 5),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Wind City Rampage",
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.w600,
                      fontSize: 12.sp,
                    ),
                  ),
                  Text(
                    "Lorem Ipsum Text",
                    style: TextStyle(
                      fontWeight: FontWeight.w400,
                      fontSize: 8.8.sp,
                    ),
                  ),
                ],
              ),
            ),
            Expanded(child: Container()),
            Container(
              margin: EdgeInsets.only(right: 10),
              child: Ink(
                width: 75.w,
                height: 25.h,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12),
                  color: Colors.red,
                ),
                child: InkWell(
                  borderRadius: BorderRadius.circular(12),
                  onTap: () {},
                  child: Center(
                    child: Text(
                      "Join",
                      style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.w900,
                          fontSize: 10.sp),
                    ),
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
