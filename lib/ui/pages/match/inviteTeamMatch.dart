import 'package:flutter/material.dart';
import 'package:get/get_core/get_core.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:vamos/core/service/controller/matchController.dart';
import 'package:vamos/core/service/controller/teamListingController.dart';
import 'package:vamos/ui/utils/color.dart';
import 'package:vamos/ui/utils/loginbkground.dart';
import 'package:vamos/ui/utils/theme.dart';
import 'package:vamos/ui/utils/utility.dart';
import 'package:vamos/widget/localeFloatingActionButtonDebug.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:vamos/widget/teamWidgets/registeredTeamCard.dart';

class InviteTeamPage extends StatefulWidget {
  const InviteTeamPage({Key? key}) : super(key: key);

  @override
  _InviteTeamPageState createState() => _InviteTeamPageState();
}

class _InviteTeamPageState extends State<InviteTeamPage> {
  bool pressed = false;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance!.addPostFrameCallback((_) {
      Get.put(TeamListController()).getteamlist();
    });
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: GetBuilder<TeamListController>(
      builder: (_authService) => Directionality(
        textDirection: TextDirection.ltr,
        child: Scaffold(
          floatingActionButton: LocaleFloatingActionButton(),
          body: Stack(
            children: [
              SingleChildScrollView(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Container(
                      child: Column(
                        children: [
                          Container(
                            margin: EdgeInsets.symmetric(vertical: 20.h),
                            child: Column(
                              children: [
                                Container(
                                  margin: EdgeInsets.only(bottom: 10.h),
                                  height: 56.h,
                                  child: Image.asset(
                                      "assets/images/team_logo.webp"),
                                ),
                                Text(
                                  AppLocalizations.of(context)!
                                      .invite_teams_forMatch,
                                  style:
                                      themeData().textTheme.bodyText1!.copyWith(
                                            color: profileContainerColor,
                                            fontSize: 12.sp,
                                            fontWeight: FontWeight.bold,
                                          ),
                                ),
                              ],
                            ),
                          ),
                          Container(
                            height: 20.h,
                          ),
                          ListView.builder(
                            physics: NeverScrollableScrollPhysics(),
                            shrinkWrap: true,
                            itemCount: _authService.teamList.length,
                            itemBuilder: (context, index) {
                              return ListTile(
                                title: registeredTeamContainer(
                                    context: context,
                                    team: _authService.teamList[index],
                                    buttonText: "Invite",
                                    onPressed: () {
                                      if (!_authService
                                          .teamList[index].isJoined!) {
                                        Get.find<MatchController>()
                                            .requestMatch(_authService
                                                .teamList[index].id
                                                .toString());
                                        setState(() {
                                          _authService
                                              .teamList[index].isJoined = true;
                                        });
                                      } else {
                                        Utility.showSnackbar(AppLocalizations
                                                .of(context)!
                                            .registeredTeamsPage_alreadyPresentSnackbar);
                                      }
                                    },
                                    pressed:
                                        _authService.teamList[index].isJoined),
                              );
                            },
                          ),
                        ],
                      ),
                    )
                  ],
                ),
              ),
              Align(
                alignment: Alignment.bottomCenter,
                child: Container(
                  padding: EdgeInsets.symmetric(vertical: 30),
                  child: primaryActionButton(
                      context: context,
                      onPressed: () {
                        Get.offAllNamed("/homeScreen");
                      }),
                ),
              )
            ],
          ),
        ),
      ),
    ));
  }
}
