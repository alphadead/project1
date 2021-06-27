import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:vamos/core/service/authentication_service.dart';
import 'package:vamos/ui/loginPages/register.dart';
import 'package:vamos/ui/loginPages/setPass.dart';
import 'package:vamos/ui/utils/color.dart';
import 'package:vamos/ui/utils/constants.dart';
import 'package:vamos/ui/utils/loginbkground.dart';
import 'package:vamos/ui/utils/theme.dart';
import 'package:vamos/ui/utils/validator.dart';
import 'package:vamos/widget/inputField.dart';

class SignUpPage extends StatefulWidget {
  const SignUpPage({Key? key}) : super(key: key);

  @override
  _SignUpPageState createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  GlobalKey<ScaffoldState> _loginScreen = GlobalKey<ScaffoldState>();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      key: _loginScreen,
      body: Consumer<AuthenticationService>(
        builder: (context, authService, _) => Form(
          key: _formKey,
          child: Column(
            children: [
              Expanded(
                child: Stack(
                  children: [
                    backgroundContainer(),
                    Positioned(
                      top: 5.h,
                      left: 80.w,
                      bottom: 0.h,
                      child: Image.asset(
                        'assets/images/group_3.png',
                        height: 240.h,
                        width: 370.w,
                      ),
                    ),
                    Positioned(
                      top: 100.h,
                      left: 40.w,
                      child: Text(
                        'Login',
                        style: themeData().textTheme.headline1!.copyWith(
                              color: Colors.white,
                              fontSize: 25,
                            ),
                      ),
                    ),
                  ],
                ),
              ),
              SingleChildScrollView(
                child: Padding(
                  padding: const EdgeInsets.fromLTRB(30, 10, 30, 10),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Column(
                        children: [
                          Container(
                            height: 34.h,
                            width: 34.w,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(3),
                              color: bgroundCol,
                            ),
                            child: Center(
                              child: Text(
                                '01',
                                style: TextStyle(color: Colors.white),
                              ),
                            ),
                          ),
                          SizedBox(height: 3.h),
                          Text(
                            "Sign Up",
                            style: TextStyle(color: bgroundCol),
                          ),
                        ],
                      ),
                      Column(
                        children: [
                          Container(
                            height: 34.h,
                            width: 34.w,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(3),
                              color: inactiveColor,
                            ),
                            child: Center(
                              child: Text(
                                '02',
                                style: TextStyle(color: Colors.white),
                              ),
                            ),
                          ),
                          SizedBox(height: 3.h),
                          Text(
                            "Profile",
                            style: TextStyle(
                              color: inactiveColor,
                            ),
                          ),
                        ],
                      ),
                      Column(
                        children: [
                          Container(
                            height: 34.h,
                            width: 34.w,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(3),
                              color: inactiveColor,
                            ),
                            child: Center(
                              child: Text(
                                '03',
                                style: TextStyle(color: Colors.white),
                              ),
                            ),
                          ),
                          SizedBox(height: 3.h),
                          Text(
                            "Users",
                            style: TextStyle(
                              color: inactiveColor,
                            ),
                          ),
                        ],
                      ),
                      Column(
                        children: [
                          Container(
                            height: 34.h,
                            width: 34.w,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(3),
                              color: inactiveColor,
                            ),
                            child: Center(
                              child: Text(
                                '04',
                                style: TextStyle(color: Colors.white),
                              ),
                            ),
                          ),
                          SizedBox(height: 3.h),
                          Text(
                            "Share",
                            style: TextStyle(
                              color: inactiveColor,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.all(30),
                child: inputField("Mobile No", (value) {
                  authService.mobileNo = value;
                }, validate: (arg) {
                  arg = authService.mobileNo;
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
                    authService.password = value;
                  }, validate: (arg) {
                    arg = authService.password;
                    if (ValidateFeild().isValidatePassword(arg)) {
                      return null;
                    } else {
                      return "Password must be more than 6 characters";
                    }
                  }, keyType: TextInputType.name)),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  TextButton(
                    onPressed: () {},
                    child: Padding(
                      padding: const EdgeInsets.fromLTRB(0, 8, 30, 35),
                      child: Text(
                        'Forget Password ?',
                        style: TextStyle(color: inputText, fontSize: 15),
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
                      if (_formKey.currentState!.validate()) {
                        authService.login(context, _loginScreen);
                      }
                    }),
              ),
              SizedBox(
                height: 100.h,
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
                    onPressed: () {},
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
      ),
    ));
  }
}
