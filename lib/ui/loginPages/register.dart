import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:vamos/core/service/controller/authController.dart';
import 'package:vamos/ui/loginPages/setPass.dart';
import 'package:vamos/ui/loginPages/signUp.dart';
import 'package:vamos/widget/inputField.dart';
import 'package:vamos/widget/localeFloatingActionButtonDebug.dart';
import 'package:vamos/widget/loginpageStack.dart';
import 'package:vamos/ui/utils/color.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:vamos/ui/utils/loginbkground.dart';
import 'package:vamos/ui/utils/validator.dart';
import 'package:vamos/widget/inputField.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

enum typeenum { player, ground }

final typeValue = {typeenum.ground: "Ground", typeenum.player: "Player"};

class RegisterPage extends StatefulWidget {
  const RegisterPage({Key? key}) : super(key: key);

  @override
  _RegisterPageState createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  String radioItem = '';
  typeenum? _type;
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: GetBuilder<AuthController>(
      builder: (_authService) => Directionality(
        textDirection: TextDirection.ltr,
        child: Scaffold(
          floatingActionButton: LocaleFloatingActionButton(),
          body: SingleChildScrollView(
            child: Form(
              key: _authService.formKey2,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    decoration: BoxDecoration(
                      border: Border.all(width: 0, color: Colors.white),
                    ),
                    //clipBehavior: Clip.none,
                    margin: EdgeInsets.only(bottom: 10),
                    height: 250.h,
                    child: Stack(
                      alignment: AlignmentDirectional.bottomEnd,
                      fit: StackFit.expand,
                      children: [
                        // Container(
                        //   height: 200.h,
                        // ),
                        Positioned(
                          //top: -20,
                          left: -100.w,
                          child: Image.asset(
                            "assets/images/rectangle_1.webp",
                            width: 1.50.sw,
                            fit: BoxFit.fitWidth,
                          ),
                        ),

                        Row(
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
                        Positioned(
                          top: 160.0.h,
                          left: 40.0.w,
                          child: Text(
                            AppLocalizations.of(context)!.registerPage_title,
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 20.sp,
                                fontWeight: FontWeight.bold),
                          ),
                        ),
                      ],
                    ),
                  ),
                  margin: EdgeInsets.only(bottom: 10),
                  //height: 350.h,
                  child: Column(
                    children: [
                      Padding(
                        padding: EdgeInsets.fromLTRB(30, 0, 30, 0),
                        child: inputField(AppLocalizations.of(context)!.registerPage_firstName, (value) {
                          _authService.firstName = value;
                        }, validate: (arg) {
                          arg = _authService.firstName;
                          if (ValidateFeild().isValidateName(arg)) {
                            return null;
                          } else {
                            return "Fill with characters";
                          }
                        }, keyType: TextInputType.name),
                      ),
                      Padding(
                        padding: EdgeInsets.fromLTRB(30, 10, 30, 0),
                        child: inputField(AppLocalizations.of(context)!.registerPage_lastName, (value) {
                          _authService.lastName = value;
                        }, validate: (arg) {
                          arg = _authService.lastName;
                          if (ValidateFeild().isValidateName(arg)) {
                            return null;
                          } else {
                            return "Fill with characters";
                          }
                        }, keyType: TextInputType.name),
                      ),
                      Padding(
                        padding: EdgeInsets.fromLTRB(30, 10, 30, 0),
                        child: inputField(AppLocalizations.of(context)!.registerPage_address, (value) {
                          _authService.address = value;
                        }, validate: (arg) {
                          arg = _authService.address;
                          if (ValidateFeild().isValidateName(arg)) {
                            return null;
                          } else {
                            return "Fill with characters";
                          }
                        }, keyType: TextInputType.name),
                      ),
                      Padding(
                        padding: EdgeInsets.fromLTRB(30, 10, 30, 0),
                        child: inputField(AppLocalizations.of(context)!.registerPage_email, (value) {
                          _authService.email = value;
                        }, validate: (arg) {
                          arg = _authService.email;
                          if (ValidateFeild().isEmailValid(arg)) {
                            return null;
                          } else {
                            return "Enter valid email";
                          }
                        }, keyType: TextInputType.emailAddress),
                      ),
                      Padding(
                        padding: EdgeInsets.fromLTRB(30, 10, 30, 0),
                        child: inputField(AppLocalizations.of(context)!.registerPage_mobile, (value) {
                          _authService.mobileNo = value;
                        }, validate: (arg) {
                          arg = _authService.mobileNo;
                          if (ValidateFeild().isValidatePhone(arg)) {
                            return null;
                          } else {
                            return "Enter valid phone number";
                          }
                        }, keyType: TextInputType.phone),
                      ),
                      Padding(
                        padding: EdgeInsets.fromLTRB(30, 20, 30, 30),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Container(
                              child: Row(
                                children: [
                                  Transform.scale(
                                    scale: 1.35,
                                    child: Radio(
                                      visualDensity: VisualDensity.compact,
                                      splashRadius: 15,
                                      fillColor: MaterialStateProperty.all(
                                          profileContainerColor),
                                      value: typeenum.player,
                                      groupValue: _type,
                                      onChanged: (typeenum? value) {
                                        setState(() {
                                          _type = value;
                                          _authService.type =
                                              typeValue[_type].toString();
                                        });
                                      },
                                    ),
                                    Text(
                                      AppLocalizations.of(context)!
                                          .profilePage_player,
                                      style: TextStyle(
                                          fontSize: 15, color: lightGrey),
                                    )
                                  ],
                                ),
                              ),
                              Container(
                                child: Row(
                                  children: [
                                    Transform.scale(
                                      scale: 1.35,
                                      child: Radio(
                                        visualDensity: VisualDensity.compact,
                                        splashRadius: 15,
                                        fillColor: MaterialStateProperty.all(
                                            profileContainerColor),
                                        value: typeenum.ground,
                                        groupValue: _type,
                                        onChanged: (typeenum? value) {
                                          setState(() {
                                            _type = value;
                                            _authService.type =
                                                typeValue[_type].toString();
                                          });
                                        },
                                      ),
                                    ),
                                    Text(
                                      AppLocalizations.of(context)!
                                          .registerPage_ground,
                                      style: TextStyle(
                                          fontSize: 15, color: lightGrey),
                                    )
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                        Center(
                            child: primaryActionButton(
                          context: context,
                          onPressed: () {
                            if (_authService.formKey2.currentState!
                                .validate()) {
                              _authService.registerStep();
                            }
                          },
                        )),
                        SizedBox(
                          height: 40,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              AppLocalizations.of(context)!
                                  .registerPage_alreadyhaveAccount,
                              style: TextStyle(
                                color: inputText,
                                fontFamily: 'Poppins',
                              ),
                            ),
                            TextButton(
                              onPressed: () {
                                Get.offNamed("/login");
                              },
                              child: Text(
                                AppLocalizations.of(context)!
                                    .registerPage_signIn,
                                style: TextStyle(
                                    fontFamily: 'Poppins',
                                    color: labelText,
                                    decoration: TextDecoration.underline,
                                    fontSize: 15),
                                textAlign: TextAlign.end,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    ));
  }
}
