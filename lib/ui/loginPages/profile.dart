import 'package:flutter/material.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:vamos/core/service/controller/authController.dart';
import 'package:vamos/ui/loginPages/profileWidgets/fitness.dart';
import 'package:vamos/ui/loginPages/profileWidgets/nationality.dart';
import 'package:vamos/ui/loginPages/profileWidgets/playertypeRadio.dart';
import 'package:vamos/ui/loginPages/profileWidgets/positionRadio.dart';
import 'package:vamos/ui/loginPages/profileWidgets/profileandVideo.dart';
import 'package:vamos/ui/utils/color.dart';
import 'package:vamos/ui/utils/loginbkground.dart';
import 'package:vamos/ui/utils/theme.dart';
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
          floatingActionButton: LocaleFloatingActionButton(),
          backgroundColor: Colors.white,
          body: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                LoginPageStack(
                  heading: AppLocalizations.of(context)!.profilePage_title,
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
                SkillVideo(),
                Container(
                  padding: EdgeInsets.only(bottom: 37.h),
                  child: Center(
                    child: primaryActionButton(
                        context: context,
                        onPressed: () {
                          _authService.profile();
                        },
                        text: AppLocalizations.of(context)!
                            .profilePage_navButtonText),
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
