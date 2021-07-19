import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:vamos/ui/loginPages/profile.dart';
import 'package:vamos/ui/loginPages/signUp.dart';
import 'package:vamos/ui/utils/color.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:vamos/ui/utils/loginbkground.dart';
import 'package:vamos/ui/utils/theme.dart';
import 'package:vamos/widget/inputField.dart';
import 'package:vamos/widget/localeFloatingActionButtonDebug.dart';
import 'package:vamos/widget/loginpageStack.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class SetPass extends StatefulWidget {
  const SetPass({Key? key}) : super(key: key);

  @override
  _SetPassState createState() => _SetPassState();
}

class _SetPassState extends State<SetPass> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        floatingActionButton: LocaleFloatingActionButton(),
        body: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              LoginPageStack(
                heading: AppLocalizations.of(context)!.setPasswordPage_title,
                imageWidget: Positioned(
                  top: -15.h,
                  left: 155.w,
                  height: 260.h,
                  width: 330.w,
                  child: Image.asset(
                    'assets/images/setPass.png',
                  ),
                ),
              ),
              Container(
                child: Column(
                  children: [
                    RegisterPageTextField(
                      label: AppLocalizations.of(context)!.setPasswordPage_otp,
                    ),
                    RegisterPageTextField(
                      label:
                          AppLocalizations.of(context)!.setPasswordPage_title,
                      obscureText: true,
                    ),
                    RegisterPageTextField(
                      label: AppLocalizations.of(context)!
                          .setPasswordPage_confirmPass,
                      obscureText: true,
                    ),
                    Padding(
                      padding: const EdgeInsets.all(20.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: [],
                      ),
                    ),
                    Center(
                      child: primaryActionButton(
                        context: context,
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => ProfilePage(),
                            ),
                          );
                        },
                      ),
                    ),
                    SizedBox(
                      height: 50,
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
