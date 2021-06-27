import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:vamos/ui/loginPages/register.dart';
import 'package:vamos/ui/loginPages/setPass.dart';
import 'package:vamos/ui/utils/color.dart';
import 'package:vamos/ui/utils/constants.dart';
import 'package:vamos/ui/utils/loginbkground.dart';
import 'package:vamos/ui/utils/theme.dart';

class SignUpPage extends StatefulWidget {
  const SignUpPage({Key? key}) : super(key: key);

  @override
  _SignUpPageState createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Container(
              child: Column(
                children: [
                  Container(
                    decoration: BoxDecoration(
                      border: Border.all(width: 0, color: Colors.white),
                    ),
                    margin: EdgeInsets.only(bottom: 10),
                    height: 250.h,
                    child: Stack(
                      alignment: AlignmentDirectional.bottomEnd,
                      fit: StackFit.expand,
                      children: [
                        Positioned(
                          left: -100.w,
                          child: Image.asset(
                            "assets/images/rectangle_1.webp",
                            width: 1.50.sw,
                            fit: BoxFit.fitWidth,
                          ),
                        ),
                        Positioned(
                          bottom: -50.h,
                          left: 120.w,
                          height: 330.h,
                          width: 330.w,
                          child: Image.asset(
                            'assets/images/group_3.png',
                          ),
                        ),
                        Positioned(
                          top: 160.0.h,
                          left: 40.0.w,
                          child: Text(
                            'Login',
                            style: themeData().textTheme.headline1!.copyWith(
                                  fontSize: 25.sp,
                                  color: titleText,
                                  fontWeight: FontWeight.bold,
                                ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Padding(
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
                                  style: themeData().textTheme.headline1,
                                ),
                              ),
                            ),
                            SizedBox(height: 3.h),
                            Text(
                              "Sign Up",
                              style: themeData()
                                  .textTheme
                                  .headline1!
                                  .copyWith(color: bgroundCol, fontSize: 12),
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
                                  style: themeData().textTheme.headline1,
                                ),
                              ),
                            ),
                            SizedBox(height: 3.h),
                            Text(
                              "Profile",
                              style: themeData()
                                  .textTheme
                                  .headline1!
                                  .copyWith(color: inactiveColor, fontSize: 12),
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
                                  style: themeData().textTheme.headline1,
                                ),
                              ),
                            ),
                            SizedBox(height: 3.h),
                            Text(
                              "Users",
                              style: themeData()
                                  .textTheme
                                  .headline1!
                                  .copyWith(color: inactiveColor, fontSize: 12),
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
                                  style: themeData().textTheme.headline1,
                                ),
                              ),
                            ),
                            SizedBox(height: 3.h),
                            Text(
                              "Share",
                              style: themeData()
                                  .textTheme
                                  .headline1!
                                  .copyWith(color: inactiveColor, fontSize: 12),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            Container(
              decoration: BoxDecoration(
                border: Border.all(width: 0, color: Colors.white),
              ),
              height: 300.h,
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    Padding(
                      padding: EdgeInsets.fromLTRB(30, 0, 30, 0),
                      child: TextField(
                        style: TextStyle(color: inputText),
                        decoration: InputDecoration(
                          enabledBorder: UnderlineInputBorder(
                            borderSide: BorderSide(color: inputText),
                          ),
                          labelText: 'Mobile No',
                          labelStyle: themeData()
                              .textTheme
                              .headline1!
                              .copyWith(color: labelText),
                        ),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.fromLTRB(30, 10, 30, 0),
                      child: TextField(
                        obscuringCharacter: '*',
                        obscureText: true,
                        style: TextStyle(color: inputText),
                        decoration: InputDecoration(
                          enabledBorder: UnderlineInputBorder(
                            borderSide: BorderSide(color: inputText),
                          ),
                          labelText: 'Password',
                          labelStyle: themeData()
                              .textTheme
                              .headline1!
                              .copyWith(color: labelText),
                        ),
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        TextButton(
                          onPressed: () {},
                          child: Padding(
                            padding: const EdgeInsets.fromLTRB(0, 8, 30, 35),
                            child: Text(
                              'Forget Password ?',
                              style: themeData()
                                  .textTheme
                                  .headline1!
                                  .copyWith(color: inputText, fontSize: 15),
                              textAlign: TextAlign.end,
                            ),
                          ),
                        ),
                      ],
                    ),
                    Center(
                      child: buttonLogin(
                        context,
                        () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => RegisterPage(),
                            ),
                          );
                        },
                      ),
                    ),
                    SizedBox(
                      height: 40.h,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'Not registered yet ? ',
                          style: themeData()
                              .textTheme
                              .headline1!
                              .copyWith(color: labelText, fontSize: 15),
                        ),
                        TextButton(
                          onPressed: () {},
                          child: Text(
                            'Create an Account',
                            style: TextStyle(
                                fontFamily: 'Poppins',
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
          ],
        ),
      ),
    );
  }
}
