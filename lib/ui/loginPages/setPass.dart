import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:vamos/ui/loginPages/signUp.dart';
import 'package:vamos/ui/utils/color.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:vamos/ui/utils/loginbkground.dart';
import 'package:vamos/ui/utils/theme.dart';

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
        body: Column(
          children: [
            Expanded(
              child: Stack(
                children: [
                  backgroundContainer(),
                  Positioned(
                    top: -35.h,
                    left: 150.w,
                    child: Image.asset(
                      'assets/images/setPass.png',
                      height: 340.h,
                      width: 300.w,
                    ),
                  ),
                  Positioned(
                      top: 125.h,
                      left: 40.w,
                      child: Text('Set Password',
                          style: themeData().textTheme.headline1!.copyWith(
                                color: Colors.white,
                                fontSize: 20.sp,
                              ))
                      // Text(
                      //   'Register',
                      //   style: TextStyle(
                      //       color: Colors.white,
                      //       fontSize: 20.sp,
                      //       fontWeight: FontWeight.bold),
                      // ),
                      ),
                ],
              ),
            ),
            Padding(
              padding: EdgeInsets.fromLTRB(30, 0, 30, 0),
              child: TextField(
                style: TextStyle(color: inputText),
                decoration: InputDecoration(
                  enabledBorder: UnderlineInputBorder(
                    borderSide: BorderSide(color: inputText),
                  ),
                  labelText: 'OTP',
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
                  labelText: 'Set Password',
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
                  labelText: 'Confirm Password',
                  labelStyle: TextStyle(
                    color: labelText,
                    fontFamily: 'Poppins',
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [],
              ),
            ),
            Center(child: buttonLogin(context, () {})),
            SizedBox(
              height: 100,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'Already have an account ? ',
                  style: TextStyle(
                    color: labelText,
                    fontFamily: 'Poppins',
                  ),
                ),
                TextButton(
                  onPressed: () {},
                  child: Text(
                    'Sign In',
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
              height: 10,
            ),
          ],
        ),
      ),
    );
  }
}
