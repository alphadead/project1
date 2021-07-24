import 'package:get/get.dart';
import 'package:vamos/core/service/Binder/authBinder.dart';
import 'package:vamos/splashScreen.dart';
import 'package:vamos/testScreen.dart';
import 'package:vamos/ui/loginPages/addsandOptions.dart';
import 'package:vamos/ui/loginPages/profile.dart';
import 'package:vamos/ui/loginPages/register.dart';
import 'package:vamos/ui/loginPages/registeredteams.dart';
import 'package:vamos/ui/loginPages/signUp.dart';
import 'package:vamos/ui/loginPages/upcomingMatches.dart';
import 'package:vamos/ui/pages/inviteScreen.dart';
import 'package:vamos/widget/videoPlayer.dart';

/// Contains the list of pages or routes taken across the whole application.
/// This will prevent us in using context for navigation. And also providing
/// the blocs required in the next named routes.
///
/// [pages] : will contain all the pages in the application as a route
///                 and will be used in the material app.
abstract class AppPages {
  static var transitionDuration = const Duration(
    milliseconds: 300,
  );

  static final pages = <GetPage>[
    GetPage(
      name: '/login',
      transitionDuration: transitionDuration,
      page: () => SignUpPage(),
      binding: AllBinder(),

      // transition: Transition.downToUp,
    ),
    GetPage(
      name: '/upcomingmatches',
      transitionDuration: transitionDuration,
      page: () => UpcomingMatchesPage(),
    ),
    GetPage(
      name: '/addandOptions',
      transitionDuration: transitionDuration,
      page: () => AddandOptions(),
    ),
    GetPage(
      name: '/splashScreen',
      transitionDuration: transitionDuration,
      page: () => SplashScreen(),
    ),
    GetPage(
      name: '/testScreen',
      transitionDuration: transitionDuration,
      page: () => TestScreen(),
      transition: Transition.downToUp,
      binding: AllBinder(),
    ),
    GetPage(
      name: '/registerScreen',
      transitionDuration: transitionDuration,
      page: () => RegisterPage(),
      transition: Transition.downToUp,
      binding: AllBinder(),
    ),
    GetPage(
      name: '/profileScreen',
      transitionDuration: transitionDuration,
      page: () => ProfilePage(),
      binding: AllBinder(),
    ),
    GetPage(
      name: '/registeredTeamScreen',
      transitionDuration: transitionDuration,
      page: () => RegisteredTeamPage(),
      transition: Transition.downToUp,
      binding: AllBinder(),
    ),
    GetPage(
      name: '/inviteScreen',
      transitionDuration: transitionDuration,
      page: () => InviteScreen(),
      transition: Transition.downToUp,
      binding: AllBinder(),
    ),
    GetPage(
      name: '/videoScreen',
      transitionDuration: transitionDuration,
      page: () => VideoPlayer(),
      transition: Transition.downToUp,
      binding: AllBinder(),
    ),
  ];
}
