import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/src/simple/get_state.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:vamos/core/service/controller/profileController.dart';
import 'package:vamos/ui/utils/color.dart';
import 'package:vamos/ui/utils/loginbkground.dart';
import 'package:vamos/ui/utils/theme.dart';
import 'package:vamos/widget/formWidgets/buttons.dart';
import 'package:vamos/widget/customAppBar.dart';
import 'package:vamos/widget/customBottomNavBar.dart';

class Settings extends StatefulWidget {
  const Settings({Key? key}) : super(key: key);

  @override
  _SettingsState createState() => _SettingsState();
}

class _SettingsState extends State<Settings> {

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: GetBuilder<ProfileController>(
        builder: (_profileService) {
          return Directionality(
            textDirection: TextDirection.ltr,
            child: Scaffold(
              appBar: PreferredSize(
                preferredSize: Size.fromHeight(60.h),
                child: CustomAppBar(),
              ),
              floatingActionButton: homeFABBottomNav(),
              floatingActionButtonLocation:
                  FloatingActionButtonLocation.miniCenterDocked,
              bottomNavigationBar: CustomBottomAppBar(
                height: 50.h,
              ),
              body: SingleChildScrollView(
                padding: EdgeInsets.symmetric(horizontal: 30.w, vertical: 30.h),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    _profileService.profile?.photo == null ||
                            _profileService.profile?.photo.toString() == ''
                        ? CircleAvatar(
                            radius: 40.h,
                            backgroundImage: AssetImage(
                                'assets/images/placeholder_team_icon.png'))
                        : CircleAvatar(
                            radius: 40.h,
                            backgroundImage: NetworkImage(_profileService
                                .profile!.photo![0]["url"]
                                .toString()),
                          ),
                    SizedBox(
                      height: 35.h,
                    ),
                    Center(
                      child: Text(
                        'Settings',
                        style: themeData().textTheme.bodyText1!.copyWith(
                              color: KRed,
                              fontSize: 14.sp,
                              fontWeight: FontWeight.bold,
                            ),
                      ),
                    ),
                    SizedBox(
                      height: 150.h,
                    ),
                    primaryActionButton(
                        context: context,
                        onPressed: () async {
                          SharedPreferences prefs =
                              await SharedPreferences.getInstance();
                          prefs.clear();
                          Get.offAllNamed("/login");
                        },
                        text: "Logout"),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
