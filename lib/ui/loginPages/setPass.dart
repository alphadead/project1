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
        body: SingleChildScrollView(
          child: Column(
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
                    Positioned(
                      //top: -20,
                      left: -100.w,
                      child: Image.asset(
                        "assets/images/rectangle_1.webp",
                        width: 1.50.sw,
                        fit: BoxFit.fitWidth,
                      ),
                    ),
                    Positioned(
                      top: -15.h,
                      left: 155.w,
                      height: 260.h,
                      width: 330.w,
                      child: Image.asset(
                        'assets/images/setPass.png',
                      ),
                    ),
                    Positioned(
                      top: 140.0.h,
                      left: 40.0.w,
                      child: Text(
                        'Set Password',
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
                    Center(
                      child: primaryActionButton(
                        context: context,
                        onPressed: () {},
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
