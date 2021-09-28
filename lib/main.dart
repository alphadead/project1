import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/route_manager.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:vamos/locator.dart';
import 'package:vamos/ui/utils/theme.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'core/service/routes/appPage.dart';

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
    return ScreenUtilInit(
      designSize: Size(360, 690),
      builder: () => GetMaterialApp(
        theme: themeData(),
        localizationsDelegates: const [
          AppLocalizations.delegate,
          GlobalMaterialLocalizations.delegate,
          GlobalWidgetsLocalizations.delegate,
          GlobalCupertinoLocalizations.delegate,
        ],
        supportedLocales: const [
          Locale('en', ''), // English, no country code
          Locale('ar', ''), // Spanish, no country code
        ],
        locale: Get.deviceLocale,
        debugShowCheckedModeBanner: false,
        initialRoute: "/splashScreen",
        // initialRoute: "/teamPreview",
        getPages: AppPages.pages,
      ),
    );
  }
}
