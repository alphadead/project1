import 'package:device_preview/device_preview.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:vamos/core/service/authentication_service.dart';
import 'package:vamos/core/service/loader.dart';
import 'package:vamos/locator.dart';
import 'package:vamos/splashScreen.dart';
import 'package:vamos/testScreen.dart';
import 'package:vamos/ui/loginPages/setPass.dart';
import 'package:vamos/ui/loginPages/signUp.dart';
import 'package:vamos/ui/utils/theme.dart';

import 'ui/loginPages/register.dart';

void main() {
  setupLocator();
  runApp(MyApp());
}

// void main() {
//   setupLocator();
//   runApp(
//     DevicePreview(
//       enabled: !kReleaseMode,
//       builder: (context) => MyApp(),
//     ),
//   );
// }

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) => AuthenticationService(),
        ),
        ChangeNotifierProvider(
          create: (context) => Loader(),
        )
      ],
      child: ScreenUtilInit(
        designSize: Size(360, 690),
        builder: () => MaterialApp(
          theme: themeData(),
          debugShowCheckedModeBanner: false,
          home: SplashScreen(),
        ),
      ),
    );
  }
}
