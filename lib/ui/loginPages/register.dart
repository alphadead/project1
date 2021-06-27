import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:vamos/ui/loginPages/setPass.dart';
import 'package:vamos/ui/utils/color.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:vamos/ui/utils/loginbkground.dart';

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
        body: SingleChildScrollView(
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
                decoration: BoxDecoration(
                  border: Border.all(width: 0, color: Colors.white),
                ),
                margin: EdgeInsets.only(bottom: 10),
                //height: 350.h,
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
                        child: primaryActionButton(
                      context: context,
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => SetPass(),
                          ),
                        );
                      },
                    )),
                    SizedBox(
                      height: 40,
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
            ],
          ),
        ),
      ),
    );
  }
}
