import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:vamos/ui/utils/color.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

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
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Container(
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
                  // Transform.rotate(
                  //   angle: 6.0,
                  //   //origin: Offset(-250, 0),
                  //   child: Container(
                  //     width: 200.w,
                  //     height: 500.h,
                  //     decoration: BoxDecoration(
                  //       color: bgroundCol,
                  //       borderRadius: BorderRadius.circular(40),
                  //     ),
                  //   ),
                  // ),
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
                      'Register',
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 20.sp,
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                ],
              ),
            ),
            Container(
              margin: EdgeInsets.only(bottom: 10),
              height: 350.h,
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    Padding(
                      padding: EdgeInsets.fromLTRB(30, 0, 30, 0),
                      child: TextField(
                        style: TextStyle(color: labelText),
                        decoration: InputDecoration(
                          enabledBorder: UnderlineInputBorder(
                            borderSide: BorderSide(color: labelText),
                          ),
                          labelText: 'First name',
                          labelStyle: TextStyle(
                            color: inputText,
                            fontFamily: 'Poppins',
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.fromLTRB(30, 10, 30, 0),
                      child: TextField(
                        style: TextStyle(color: labelText),
                        decoration: InputDecoration(
                          enabledBorder: UnderlineInputBorder(
                            borderSide: BorderSide(color: labelText),
                          ),
                          labelText: 'Last Name',
                          labelStyle: TextStyle(
                            color: inputText,
                            fontFamily: 'Poppins',
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.fromLTRB(30, 10, 30, 0),
                      child: TextField(
                        style: TextStyle(color: labelText),
                        decoration: InputDecoration(
                          enabledBorder: UnderlineInputBorder(
                            borderSide: BorderSide(color: labelText),
                          ),
                          labelText: 'Address',
                          labelStyle: TextStyle(
                            color: inputText,
                            fontFamily: 'Poppins',
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.fromLTRB(30, 10, 30, 0),
                      child: TextField(
                        style: TextStyle(color: labelText),
                        decoration: InputDecoration(
                          enabledBorder: UnderlineInputBorder(
                            borderSide: BorderSide(color: labelText),
                          ),
                          labelText: 'Email',
                          labelStyle: TextStyle(
                            color: inputText,
                            fontFamily: 'Poppins',
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.fromLTRB(30, 10, 30, 0),
                      child: TextField(
                        style: TextStyle(color: labelText),
                        decoration: InputDecoration(
                          enabledBorder: UnderlineInputBorder(
                            borderSide: BorderSide(color: labelText),
                          ),
                          labelText: 'Mobile No',
                          labelStyle: TextStyle(
                            color: inputText,
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
                      child: GestureDetector(
                        child: Container(
                          width: 250,
                          height: 40,
                          child: Center(
                            child: Text(
                              'Continue',
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 15,
                                color: Colors.white,
                              ),
                            ),
                          ),
                          decoration: BoxDecoration(
                            color: Color.fromRGBO(239, 77, 35, 1),
                            //(#ef4d23),
                            borderRadius: BorderRadius.circular(30),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 100,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'Already have an account ? ',
                          style: TextStyle(
                            color: inputText,
                            fontFamily: 'Poppins',
                          ),
                        ),
                        TextButton(
                          onPressed: () {},
                          child: Text(
                            'Sign In',
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
            ),
          ],
        ),
      ),
    );
  }
}
