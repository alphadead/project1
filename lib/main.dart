import 'package:device_preview/device_preview.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:vamos/locator.dart';
import 'package:vamos/loginPages/register.dart';
import 'package:vamos/loginPages/signUp.dart';
import 'package:vamos/testScreen.dart';

// void main() {
//   setupLocator();
//   runApp(MyApp());
// }

void main() {
  setupLocator();
  runApp(
    DevicePreview(
      enabled: !kReleaseMode,
      builder: (context) => MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: Size(360, 690),
      builder: () => MaterialApp(
        debugShowCheckedModeBanner: false,
        home: RegisterPage(),
      ),
    );
  }
}
