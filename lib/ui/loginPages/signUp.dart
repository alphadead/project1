import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';
import 'package:vamos/core/service/controller/authController.dart';
import 'package:vamos/ui/loginPages/register.dart';
import 'package:vamos/ui/loginPages/setPass.dart';
import 'package:vamos/widget/loginpageIndicator.dart';
import 'package:vamos/widget/loginpageStack.dart';
import 'package:vamos/ui/utils/color.dart';
import 'package:vamos/ui/utils/constants.dart';
import 'package:vamos/ui/utils/loginbkground.dart';
import 'package:vamos/ui/utils/theme.dart';
import 'package:vamos/ui/utils/validator.dart';
import 'package:vamos/widget/inputField.dart';

class SignUpPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: GetBuilder<AuthController>(
      builder: (_authService) => Scaffold(
        body: Form(
          key: _authService.formKey,
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Container(
                  child: Column(
                    children: [
                      LoginPageStack(
                        heading: "Login",
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
                      Padding(
                        padding: const EdgeInsets.fromLTRB(30, 10, 30, 10),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            LoginPageIndicator(
                              count: "01",
                              page: "Sign Up",
                              active: true,
                            ),
                            LoginPageIndicator(
                              count: "02",
                              page: "Profile",
                              active: false,
                            ),
                            LoginPageIndicator(
                              count: "03",
                              page: "Users",
                              active: false,
                            ),
                            LoginPageIndicator(
                              count: "04",
                              page: "Share",
                              active: false,
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                Container(
                  child: Column(
                    children: [
                      Padding(
                        padding: EdgeInsets.fromLTRB(30, 0, 30, 0),
                        child: inputField("Mobile No", (value) {
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
                          padding: EdgeInsets.fromLTRB(30, 10, 30, 0),
                          child: inputPasswordField('Password', (value) {
                            _authService.password = value;
                          }, validate: (arg) {
                            arg = _authService.password;
                            if (ValidateFeild().isValidatePassword(arg)) {
                              return null;
                            } else {
                              return "Password must be more than 6 characters";
                            }
                          }, keyType: TextInputType.name)),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          Padding(
                            padding: const EdgeInsets.fromLTRB(0, 8, 30, 35),
                            child: TextButton(
                              onPressed: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => SetPass(),
                                  ),
                                );
                              },
                              child: Text(
                                'Forget Password ?',
                                style:
                                    TextStyle(color: inputText, fontSize: 15),
                                textAlign: TextAlign.end,
                              ),
                            ),
                          ),
                        ],
                      ),
                      Center(
                        child: primaryActionButton(
                            context: context,
                            onPressed: () {
                              if (_authService.formKey.currentState!
                                  .validate()) {
                                _authService.login();
                              }
                            }),
                      ),
                      SizedBox(
                        height: 40,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            'Not registered yet ? ',
                            style: TextStyle(
                              color: labelText,
                              fontFamily: 'Poppins',
                            ),
                          ),
                          TextButton(
                            onPressed: () {
                              Get.offNamed('/registerScreen');
                            },
                            child: Text(
                              'Create an Account',
                              style: TextStyle(
                                  color: inputText,
                                  decoration: TextDecoration.underline,
                                  fontSize: 15),
                              textAlign: TextAlign.end,
                            ),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 10.h,
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
