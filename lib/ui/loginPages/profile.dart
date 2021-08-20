import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:vamos/core/models/profileDataResponse.dart';
import 'package:vamos/core/service/controller/authController.dart';
import 'package:vamos/core/service/controller/profileController.dart';
import 'package:vamos/ui/loginPages/profileWidgets/fitness.dart';
import 'package:vamos/ui/loginPages/profileWidgets/nationality.dart';
import 'package:vamos/ui/loginPages/profileWidgets/nickname.dart';
import 'package:vamos/ui/loginPages/profileWidgets/playertypeRadio.dart';
import 'package:vamos/ui/loginPages/profileWidgets/positionRadio.dart';
import 'package:vamos/ui/loginPages/profileWidgets/profileandVideo.dart';
import 'package:vamos/ui/utils/color.dart';
import 'package:vamos/ui/utils/loginbkground.dart';
import 'package:vamos/ui/utils/theme.dart';
import 'package:vamos/widget/customAppBar.dart';
import 'package:vamos/widget/inputField.dart';
import 'package:vamos/widget/localeFloatingActionButtonDebug.dart';
import 'package:vamos/widget/loginpageStack.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:vamos/widget/numvalueContainer.dart';
import 'package:vamos/widget/profileContainer.dart';
import 'package:country_picker/country_picker.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({Key? key}) : super(key: key);

  @override
  void initState() {
    bool isEditCheck = Get.arguments;
    if (isEditCheck) {
      Get.find<ProfileController>().getProfileData();
    }
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: GetBuilder<ProfileController>(
      builder: (_profileService) => Directionality(
        textDirection: TextDirection.ltr,
        child: Scaffold(
          appBar: Get.arguments
              ? PreferredSize(
                  preferredSize: Size.fromHeight(60.h),
                  child: CustomAppBar(),
                )
              : PreferredSize(child: Container(), preferredSize: Size.zero),
          floatingActionButton: LocaleFloatingActionButton(),
          backgroundColor: Colors.white,
          body: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Get.arguments
                    ? Container(
                        height: 200.h,
                        margin: EdgeInsets.only(top: 10.h),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Container(
                              margin: EdgeInsets.only(left: 30.w),
                              child: Text(
                                AppLocalizations.of(context)!.profilePage_title,
                                style:
                                    themeData().textTheme.bodyText1!.copyWith(
                                          color: profileContainerColor,
                                          fontSize: 20.sp,
                                          fontWeight: FontWeight.bold,
                                        ),
                              ),
                            ),
                            Container(
                              height: 180.h,
                              child: Image.asset(
                                'assets/images/register.png',
                              ),
                            ),
                          ],
                        ),
                      )
                    : LoginPageStack(
                        heading:
                            AppLocalizations.of(context)!.signUpPage_profile,
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
                PlayerTypeRadioList(),
                PositionRadioList(),
                FitnessDetail(),
                Nationality(),
                ProfilePhoto(),
                NickName(),
                SkillVideo(),
                Get.arguments
                    ? Container(
                        padding: EdgeInsets.only(top: 30),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Container(
                              padding: EdgeInsets.only(top: 15.h, bottom: 37.h),
                              child: Center(
                                child: primaryActionButton(
                                  width: 120.w,
                                  height: 40.h,
                                  color: moneyBox,
                                  context: context,
                                  onPressed: () {
                                    Get.back();
                                  },
                                  text: AppLocalizations.of(context)!
                                      .profilePage_cancel,
                                ),
                              ),
                            ),
                            SizedBox(
                              width: 10,
                            ),
                            Container(
                              padding: EdgeInsets.only(top: 15.h, bottom: 37.h),
                              child: Center(
                                child: primaryActionButton(
                                  width: 120.w,
                                  height: 40.h,
                                  context: context,
                                  onPressed: () {
                                    _profileService.updateProfile(
                                        argument: Get.arguments);
                                  },
                                  text: AppLocalizations.of(context)!
                                      .profilePage_update,
                                ),
                              ),
                            ),
                          ],
                        ),
                      )
                    : Container(
                        padding: EdgeInsets.only(top: 15.h, bottom: 37.h),
                        child: Center(
                          child: primaryActionButton(
                              context: context,
                              onPressed: () {
                                _profileService.updateProfile(
                                    argument: Get.arguments);
                              },
                              text: AppLocalizations.of(context)!
                                  .primaryActionButton),
                        ),
                      ),
              ],
            ),
          ),
        ),
      ),
    ));
  }
}
