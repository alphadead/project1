import 'dart:async';

import 'package:flutter/material.dart';

import 'package:vamos/testScreen.dart';

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  double width = 0;
  bool isVisible = false;
  @override
  void initState() {
    super.initState();
    Timer(Duration(seconds: 1), sizechange);
    Timer(Duration(seconds: 4), movepage);
  }

  void sizechange() {
    setState(() {
      width = 130;
    });
  }

  void movepage() {
    // Navigator.pushReplacement(
    //     context, MaterialPageRoute(builder: (context) => TestScreen()));
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
            Expanded(
              flex: 1,
              child: Container(),
            ),
            AnimatedContainer(
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
            Expanded(
              flex: 2,
              child: Container(),
            ),
          ],
        )
      ],
    ));
  }
}
