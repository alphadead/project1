import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:vamos/core/service/controller/authController.dart';
import 'package:vamos/ui/utils/color.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:vamos/ui/utils/theme.dart';
import 'package:vamos/widget/customAppBar.dart';
import 'package:vamos/widget/customBottomNavBar.dart';

class UpcomingMatchesPage extends StatelessWidget {
  const UpcomingMatchesPage({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: GetBuilder<AuthController>(
        builder: (_authService) => Scaffold(
          floatingActionButtonLocation:
              FloatingActionButtonLocation.miniCenterDocked,
          floatingActionButton: Container(
            width: 60.w,
            child: FittedBox(
              child: FloatingActionButton(
                elevation: 0,
                onPressed: () {},
                backgroundColor: KRed,
                child: SizedBox(
                  height: 30,
                  child: Image.asset(
                    "assets/images/FloatingActionButton.png",
                    // scale: 30,
                  ),
                ),
              ),
            ),
          ),
          bottomNavigationBar: CustomBottomAppBar(
            height: 50.h,
          ),
          appBar: PreferredSize(
            preferredSize: Size.fromHeight(60.h),
            child: CustomAppBar(),
          ),
        ),
      ),
    );
  }
}
