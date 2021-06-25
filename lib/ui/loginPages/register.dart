import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:vamos/ui/loginPages/setPass.dart';
import 'package:vamos/ui/utils/color.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:vamos/ui/utils/loginbkground.dart';
import 'package:vamos/ui/utils/theme.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({Key? key}) : super(key: key);

  @override
  _RegisterPageState createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
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
                    top: 10.h,
                    left: 100.w,
                    child: Image.asset(
                      'assets/images/register.png',
                      height: 250.h,
                      width: 270.w,
                    ),
                  ),
                  Positioned(
                      top: 170.h,
                      left: 60.w,
                      child: Text('Register',
                          style: themeData().textTheme.headline1!.copyWith(
                                color: Colors.white,
                                fontSize: 30,
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
              padding: EdgeInsets.fromLTRB(30, 10, 30, 0),
              child: TextField(
                style: TextStyle(color: inputText),
                decoration: InputDecoration(
                  enabledBorder: UnderlineInputBorder(
                    borderSide: BorderSide(color: inputText),
                  ),
                  labelText: 'First name',
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
                style: TextStyle(color: inputText),
                decoration: InputDecoration(
                  enabledBorder: UnderlineInputBorder(
                    borderSide: BorderSide(color: inputText),
                  ),
                  labelText: 'Last Name',
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
                style: TextStyle(color: inputText),
                decoration: InputDecoration(
                  enabledBorder: UnderlineInputBorder(
                    borderSide: BorderSide(color: inputText),
                  ),
                  labelText: 'Address',
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
                style: TextStyle(color: inputText),
                decoration: InputDecoration(
                  enabledBorder: UnderlineInputBorder(
                    borderSide: BorderSide(color: inputText),
                  ),
                  labelText: 'Email',
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
              padding: const EdgeInsets.all(20.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [],
              ),
            ),
            Center(
                child: buttonLogin(
              context,
              () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => SetPass(),
                  ),
                );
              },
            )),
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
