import 'package:flutter/material.dart';
import 'package:get/get_core/get_core.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:vamos/core/service/controller/authController.dart';
import 'package:vamos/core/service/controller/teamListingController.dart';
import 'package:vamos/ui/utils/loginbkground.dart';
import 'package:vamos/ui/utils/utility.dart';
import 'package:vamos/widget/localeFloatingActionButtonDebug.dart';
import 'package:vamos/widget/loginpageStack.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:vamos/widget/registeredTeamCard.dart';

class RegisteredTeamPage extends StatefulWidget {
  const RegisteredTeamPage({Key? key}) : super(key: key);

  @override
  _RegisteredTeamPageState createState() => _RegisteredTeamPageState();
}

class _RegisteredTeamPageState extends State<RegisteredTeamPage> {
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
          body: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Container(
                  child: Column(
                    children: [
                      LoginPageStack(
                        heading: AppLocalizations.of(context)!
                            .registeredTeamsPage_registeredTeams,
                        imageWidget: Positioned(
                          bottom: -50.h,
                          left: 120.w,
                          height: 330.h,
                          width: 330.w,
                          child: Image.asset(
                            'assets/images/group_3.png',
                          ),
                        ),
                      ),
                      Container(
                        height: 20,
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
                                buttonText: AppLocalizations.of(context)!
                                    .registeredTeamsPage_joinButtonText,
                                onPressed: () {
                                  if (!_authService.teamList[index].isJoined!) {
                                    _authService.joinTeam(
                                        _authService.teamList[index].id!);
                                    setState(() {
                                      _authService.teamList[index].isJoined =
                                          true;
                                    });
                                  } else {
                                    Utility.showSnackbar(AppLocalizations.of(
                                            context)!
                                        .registeredTeamsPage_alreadyPresentSnackbar);
                                  }
                                },
                                pressed: _authService.teamList[index].isJoined),
                          );
                        },
                      ),
                      Container(
                        padding: EdgeInsets.symmetric(vertical: 30),
                        child: primaryActionButton(
                            context: context,
                            onPressed: () {
                              Get.find<AuthController>()
                                  .completedStep("3", "/inviteScreen");
                            }),
                      )
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    ));
  }
}
