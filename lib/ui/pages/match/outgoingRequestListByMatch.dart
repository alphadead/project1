import 'package:flutter/material.dart';
import 'package:get/get_core/get_core.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:vamos/core/models/match/teamRequestSentByMatch.dart';
import 'package:vamos/core/service/controller/matchController.dart';
import 'package:vamos/ui/utils/color.dart';
import 'package:vamos/ui/utils/loginbkground.dart';
import 'package:vamos/ui/utils/theme.dart';
import 'package:vamos/widget/localeFloatingActionButtonDebug.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:vamos/widget/teamWidgets/registeredTeamCard.dart';

class OutgoingRequestsByMatch extends StatefulWidget {
  int? matchId;
  OutgoingRequestsByMatch({Key? key, int? matchId}) : super(key: key);

  @override
  _OutgoingRequestsByMatchState createState() =>
      _OutgoingRequestsByMatchState();
}

class _OutgoingRequestsByMatchState extends State<OutgoingRequestsByMatch> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: GetBuilder<MatchController>(
        builder: (_matchService) => Directionality(
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
                        Container(
                          margin: EdgeInsets.symmetric(vertical: 20.h),
                          child: Column(
                            children: [
                              Container(
                                margin: EdgeInsets.only(bottom: 10.h),
                                height: 56.h,
                                child:
                                    Image.asset("assets/images/team_logo.webp"),
                              ),
                              Text(
                                "Invited Teams For Match",
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
                          height: 20,
                        ),
                        ListView.builder(
                          physics: NeverScrollableScrollPhysics(),
                          shrinkWrap: true,
                          itemCount: _matchService.teams?.length ?? 0,
                          itemBuilder: (context, index) {
                            Team? team = _matchService.teams?[index];
                            return ListTile(
                              title: registeredTeamContainer(
                                  context: context,
                                  buttonText: team?.status ?? "",
                                  onPressed: () {},
                                  pressed: team?.status != "pending",
                                  name: team?.teamName),
                            );
                          },
                        ),
                        Container(
                          padding: EdgeInsets.symmetric(vertical: 30),
                          child: primaryActionButton(
                            text: "Back",
                            context: context,
                            onPressed: () {
                              Get.back();
                            },
                          ),
                        )
                      ],
                    ),
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
