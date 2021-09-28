import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:vamos/core/service/controller/matchController.dart';
import 'package:vamos/ui/utils/color.dart';
import 'package:vamos/ui/utils/loginbkground.dart';
import 'package:vamos/widget/customAppBar.dart';
import 'package:vamos/widget/customBottomNavBar.dart';
import 'package:vamos/widget/formWidgets/buttons.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:vamos/widget/matchWidgets/tabIndicator.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class CreateTeamForMatch extends StatefulWidget {
  const CreateTeamForMatch({Key? key}) : super(key: key);

  @override
  _CreateTeamForMatchState createState() => _CreateTeamForMatchState();
}

class _CreateTeamForMatchState extends State<CreateTeamForMatch> {
  bool incomingRequest = false;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance!.addPostFrameCallback((_) {
      setState(() {
        incomingRequest = Get.arguments;
      });
      Get.find<MatchController>().getPlayerPosition();
      Get.find<MatchController>().getPlayerJoinedListByTeam();
    });
  }

  Widget build(BuildContext context) {
    return GetBuilder<MatchController>(
      builder: (_matchService) => Directionality(
        textDirection: TextDirection.ltr,
        child: Scaffold(
          resizeToAvoidBottomInset: false,
          floatingActionButtonLocation:
              FloatingActionButtonLocation.miniCenterDocked,
          floatingActionButton: homeFABBottomNav(),
          bottomNavigationBar: CustomBottomAppBar(
            height: 50.h,
          ),
          appBar: PreferredSize(
            preferredSize: Size.fromHeight(60.h),
            child: CustomAppBar(),
          ),
          body: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Padding(
                padding: EdgeInsets.only(top: 10.h, left: 15.w, right: 15.w),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    tabIndicatorKRed(
                        AppLocalizations.of(context)!.select_player),
                    tabIndicatorKRed(
                        AppLocalizations.of(context)!.select_position)
                  ],
                ),
              ),
              Expanded(
                child: Padding(
                  padding: EdgeInsets.only(top: 10.h, left: 15.w, right: 15.w),
                  child: ListView.builder(
                    shrinkWrap: true,
                    itemCount: int.parse(_matchService.matchTeamSize!),
                    itemBuilder: (context, index) => Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Padding(
                          padding: const EdgeInsets.symmetric(vertical: 8.0),
                          child: SizedBox(
                            width: .4.sw,
                            child: DropdownButtonFormField(
                              isExpanded: true,
                              elevation: 25,
                              hint: Text(
                                AppLocalizations.of(context)!.player_name,
                                style: TextStyle(color: KLightGrey),
                              ),
                              onChanged: (String? newValue) {
                                _matchService.playersMap.update(
                                  index,
                                  (currentValue) {
                                    return {
                                      "player_id": newValue!,
                                      "position": currentValue["position"]!
                                    };
                                  },
                                  ifAbsent: () {
                                    print("VALUE ABSENT for index $index");
                                    return {"player_id": newValue!};
                                  },
                                );
                                print(_matchService.playersMap.entries
                                    .toString());
                              },
                              items: List.generate(
                                _matchService.playerJoinedList == null
                                    ? 0
                                    : _matchService.playerJoinedList?.length ??
                                        0,
                                (index) {
                                  return DropdownMenuItem<String>(
                                    value: _matchService
                                        .playerJoinedList?[index].userID
                                        .toString(),
                                    child: Text(
                                      (_matchService.playerJoinedList?[index]
                                                  .firstName
                                                  .toString() ??
                                              "") +
                                          " " +
                                          (_matchService
                                                  .playerJoinedList?[index]
                                                  .lastName
                                                  .toString() ??
                                              ""),
                                      style: TextStyle(
                                          color: inputText, fontSize: 16),
                                    ),
                                  );
                                },
                              ),
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(vertical: 8.0),
                          child: SizedBox(
                            width: 0.4.sw,
                            child: DropdownButtonFormField(
                              isExpanded: true,
                              elevation: 25,
                              hint: Text(
                                AppLocalizations.of(context)!.player_position,
                                style: TextStyle(color: KLightGrey),
                              ),
                              onChanged: (String? newValue) {
                                {
                                  _matchService.playersMap.update(
                                    index,
                                    (currentValue) {
                                      return {
                                        "position": newValue!,
                                        "player_id": currentValue["player_id"]!
                                      };
                                    },
                                    ifAbsent: () {
                                      print("VALUE ABSENT for index $index");
                                      return {"position": newValue!};
                                    },
                                  );
                                }
                              },
                              items: List.generate(
                                _matchService.playerPosition == null
                                    ? 0
                                    : _matchService.playerPosition?.length ?? 0,
                                (index) {
                                  return DropdownMenuItem<String>(
                                    value: _matchService.playerPosition?[index]
                                        .toString(),
                                    child: Text(
                                      _matchService.playerPosition?[index]
                                              ?.toString() ??
                                          "",
                                      style: TextStyle(
                                          color: inputText, fontSize: 16),
                                    ),
                                  );
                                },
                              ),
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                ),
              ),
              incomingRequest
                  ? primaryActionButton(
                      context: context,
                      onPressed: () {
                        _matchService.selectMatchPlayers(
                            incomingRequest: incomingRequest);
                      },
                      text: AppLocalizations.of(context)!.button_accept)
                  : primaryActionButton(
                      context: context,
                      onPressed: () {
                        _matchService.selectMatchPlayers(
                            incomingRequest: incomingRequest);
                      },
                      text: AppLocalizations.of(context)!.invite_teams),
              SizedBox(
                height: 50.h,
              )
            ],
          ),
        ),
      ),
    );
  }
}
