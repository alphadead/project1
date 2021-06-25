import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:vamos/ui/loginPages/register.dart';
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
          children: [
            Expanded(
              child: Stack(
                children: [
                  backgroundContainer(),
                  Positioned(
                    top: 20.h,
                    left: 30.w,
                    child: Image.asset(
                      'assets/images/group_3.png',
                    ),
                  ),
                  Positioned(
                    top: 150.h,
                    left: 30.w,
                    child: Text(
                      'Login',
                      style: themeData().textTheme.headline1!.copyWith(
                            color: Colors.white,
                            fontSize: 30,
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
            Padding(
              padding: EdgeInsets.all(30),
              child: TextField(
                style: TextStyle(color: inputText),
                decoration: InputDecoration(
                  enabledBorder: UnderlineInputBorder(
                    borderSide: BorderSide(color: inputText),
                  ),
                  labelText: 'Mobile No',
                  labelStyle: TextStyle(
                    color: labelText,
                    fontFamily: 'Poppins',
                  ),
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
                  labelStyle: TextStyle(
                    color: labelText,
                    fontFamily: 'Poppins',
                  ),
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
                      style: TextStyle(
                          fontFamily: 'Poppins',
                          color: inputText,
                          fontSize: 15),
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
    );
  }
}
