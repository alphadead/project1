import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:vamos/core/service/controller/authController.dart';
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
  Widget build(BuildContext context) {
    return SafeArea(
        child: GetBuilder<AuthController>(
      builder: (_authService) => Directionality(
        textDirection: TextDirection.ltr,
        child: Scaffold(
          appBar: PreferredSize(
            preferredSize: Size.fromHeight(60.h),
            child: CustomAppBar(),
          ),
          floatingActionButton: LocaleFloatingActionButton(),
          backgroundColor: Colors.white,
          body: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  height: 200.h,
                  margin: EdgeInsets.only(top: 10.h),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                        margin: EdgeInsets.only(left: 30.w),
                        child: Text(
                          AppLocalizations.of(context)!.profilePage_title,
                          style: TextStyle(
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
                ),
                PlayerTypeRadioList(),
                PositionRadioList(),
                FitnessDetail(),
                Nationality(),
                ProfilePhoto(),
                NickName(),
                SkillVideo(),
                Container(
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
                            onPressed: () {},
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
                              _authService.profile();
                            },
                            text: AppLocalizations.of(context)!
                                .profilePage_update,
                          ),
                        ),
                      ),
                    ],
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
