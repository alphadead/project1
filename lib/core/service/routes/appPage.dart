import 'package:get/get.dart';
import 'package:vamos/core/service/Binder/authBinder.dart';
import 'package:vamos/splashScreen.dart';
import 'package:vamos/testScreen.dart';
import 'package:vamos/ui/pages/match/aboutMatch.dart';
import 'package:vamos/ui/pages/createGround.dart';
import 'package:vamos/ui/pages/homeScreen.dart';
import 'package:vamos/ui/loginPages/createTeam.dart';
import 'package:vamos/ui/loginPages/profile.dart';
import 'package:vamos/ui/loginPages/register.dart';
import 'package:vamos/ui/loginPages/registeredteams.dart';
import 'package:vamos/ui/loginPages/setPass.dart';
import 'package:vamos/ui/loginPages/signUp.dart';
import 'package:vamos/ui/loginPages/upcomingMatches.dart';
import 'package:vamos/ui/pages/inviteScreen.dart';
import 'package:vamos/ui/pages/match/inviteTeamMatch.dart';
import 'package:vamos/ui/pages/joinedTeamListing.dart';
import 'package:vamos/ui/pages/match/matchListing.dart';
import 'package:vamos/ui/pages/match/outgoingRequestListByMatch.dart';
import 'package:vamos/ui/pages/myTeam.dart';
import 'package:vamos/ui/pages/playerListScreen.dart';
import 'package:vamos/ui/pages/playerListingScreen.dart';
import 'package:vamos/ui/pages/teamListScreen.dart';
import 'package:vamos/ui/pages/viewGround.dart';

import 'package:vamos/ui/pages/wallet.dart';
import 'package:vamos/widget/videoPlayer.dart';
import 'package:vamos/ui/loginPages/playerInfo.dart';

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
      name: '/createTeam',
      transitionDuration: transitionDuration,
      page: () => CreateTeams(),
      binding: AllBinder(),
    ),
    GetPage(
      name: '/homeScreen',
      transitionDuration: transitionDuration,
      page: () => HomeScreen(),
      binding: AllBinder(),
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
      name: '/aboutMatch',
      transitionDuration: transitionDuration,
      page: () => AboutMatch(),
      transition: Transition.downToUp,
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
      name: '/playerInfo',
      transitionDuration: transitionDuration,
      page: () => PlayerInfo(),
      transition: Transition.downToUp,
      binding: AllBinder(),
    ),
    GetPage(
      name: '/myTeam',
      transitionDuration: transitionDuration,
      page: () => MyTeam(),
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
    GetPage(
      name: '/networkvideoScreen',
      transitionDuration: transitionDuration,
      page: () => NetworkVideoPlayer(),
      transition: Transition.downToUp,
      binding: AllBinder(),
    ),
    GetPage(
      name: '/setPass',
      transitionDuration: transitionDuration,
      page: () => SetPass(),
      transition: Transition.downToUp,
      binding: AllBinder(),
    ),
    GetPage(
      name: '/playerListingScreen',
      transitionDuration: transitionDuration,
      page: () => PlayerListingScreen(),
      transition: Transition.downToUp,
      binding: AllBinder(),
    ),
    GetPage(
      name: '/teamList',
      transitionDuration: transitionDuration,
      page: () => TeamListScreen(),
      transition: Transition.downToUp,
      binding: AllBinder(),
    ),
    GetPage(
      name: '/viewGroundScreen',
      transitionDuration: transitionDuration,
      page: () => ViewGroundScreen(),
      transition: Transition.downToUp,
      binding: AllBinder(),
    ),
    GetPage(
      name: '/joinedTeamsList',
      transitionDuration: transitionDuration,
      page: () => JoinedTeamListingScreen(),
      transition: Transition.downToUp,
      binding: AllBinder(),
    ),
    GetPage(
      name: '/playerList',
      transitionDuration: transitionDuration,
      page: () => PlayerListScreen(),
      transition: Transition.downToUp,
      binding: AllBinder(),
    ),
    GetPage(
        name: '/createGroundScreen',
        transitionDuration: transitionDuration,
        page: () => CreateGround(),
        binding: AllBinder()),
    GetPage(
      name: '/walletPage',
      transitionDuration: transitionDuration,
      page: () => WalletPage(),
      transition: Transition.downToUp,
      binding: AllBinder(),
    ),
    GetPage(
      name: '/inviteTeamMatch',
      transitionDuration: transitionDuration,
      page: () => InviteTeamPage(),
      transition: Transition.downToUp,
      binding: AllBinder(),
    ),
    GetPage(
      name: '/matchListing',
      transitionDuration: transitionDuration,
      page: () => MatchListing(),
      transition: Transition.downToUp,
      binding: AllBinder(),
    ),
     GetPage(
      name: '/teamListingByMatch',
      transitionDuration: transitionDuration,
      page: () => OutgoingRequestsByMatch(),
      transition: Transition.downToUp,
      binding: AllBinder(),
    ),
  ];
}
