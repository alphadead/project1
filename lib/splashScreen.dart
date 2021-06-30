import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:vamos/testScreen.dart';
import 'package:vamos/ui/loginPages/signUp.dart';

import 'core/service/routes/routeManagement.dart';

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  double width = 0;
  @override
  void initState() {
    super.initState();
    Timer(Duration(seconds: 1), sizechange);
    Timer(Duration(seconds: 4), movepage);
  }

  void sizechange() {
    setState(() {
      width = 130.w;
    });
  }

  void movepage() {
    RouteManagement().goToLoginScreen();
  }

  Widget build(BuildContext context) {
    return Scaffold(
        body: Stack(
      fit: StackFit.expand,
      children: [
        Container(
          decoration: BoxDecoration(
              image: DecorationImage(
                  image: AssetImage("assets/splashBackground.webp"),
                  fit: BoxFit.cover)),
        ),
        Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Container(
              margin: EdgeInsets.only(top: 200.h),
              child: AnimatedContainer(
                width: width,
                duration: Duration(seconds: 2),
                curve: Curves.easeOutBack,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Image.asset(
                      "assets/logo.webp",
                    ),
                  ],
                ),
              ),
            ),
          ],
        )
      ],
    ));
  }
}
