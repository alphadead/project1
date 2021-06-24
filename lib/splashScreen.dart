import 'dart:async';

import 'package:flutter/material.dart';

import 'package:vamos/testScreen.dart';

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();

    Timer(Duration(seconds: 5), movepage);
  }

  void movepage() {
    Navigator.pushReplacement(
        context, MaterialPageRoute(builder: (context) => TestScreen()));
  }

  Widget build(BuildContext context) {
    return Scaffold(
        body: Stack(
      fit: StackFit.expand,
      children: [
        Container(
          decoration: BoxDecoration(
              image: DecorationImage(
                  image: AssetImage("assets/splashBackground.png"),
                  fit: BoxFit.cover)),
        ),
        Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Expanded(
                flex: 2,
                child: Container(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Image.asset("assets/logo.png"),
                    ],
                  ),
                ))
          ],
        )
      ],
    ));
  }
}
