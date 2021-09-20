import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:vamos/core/models/match/matchListResponse.dart';
import 'package:vamos/core/models/match/matchRequest.dart';
import 'package:vamos/core/models/match/matchRequestRecvdByTeam.dart';
import 'package:vamos/core/models/match/teamRequestSentByMatch.dart';
import 'package:vamos/core/models/match/updateMatchRequest.dart';
import 'package:vamos/core/models/upcomingMatches.dart';
import 'package:vamos/core/service/api/api.dart';
import 'package:vamos/core/service/controller/myTeamController.dart';
import 'package:vamos/locator.dart';
import 'package:vamos/ui/utils/utility.dart';

class MatchController extends GetxController {
  int? matchId;
  String? teamId;
  Api api = locator<Api>();
  List<Match>? _matches;
  List<Team>? _teams;
  List<MatchRequest>? _matchRequests;
  List<ComingMatch>? upcomingMatchesList;

  List<Match>? get matches => _matches;
  List<Team>? get teams => _teams;
  List<MatchRequest>? get matchRequests => _matchRequests;

  set matches(List<Match>? value) {
    _matches = value;
    update();
  }

  set teams(List<Team>? value) {
    _teams = value;
    update();
  }

  set matchRequests(List<MatchRequest>? value) {
    _matchRequests = value;
    update();
  }

  void getMatchList() async {
    Utility.showLoadingDialog();

    MatchListResponse response = await api.getMatchList();
    if (response.data != null) {
      matches = response.data;
      Utility.closeDialog();
    } else {
      Utility.showSnackbar("${response.message}");
    }
  }

  void getTeamRequestsByMatch(int? matchId) async {
    Utility.showLoadingDialog();

    TeamRequestSentByMatch response =
        await api.getTeamRequestsSentByMatch(matchId);
    if (response.data != null) {
      Utility.closeDialog();

      teams = response.data;
      Get.toNamed('/teamListingByMatch');
    } else {
      Utility.showSnackbar("${response.message}");
    }
  }

  void getIncomingRequestsByTeam() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    if (prefs.getString("register_type") == "Player") {
      int? teamId = await Get.find<MyTeamController>().getTeamInfo();

      Utility.showLoadingDialog();
      if (teamId != null) {
        MatchRequestReceivedByTeamResponse response =
            await api.getIncomingMatchRequests(teamId);
        if (response.data != null) {
          matchRequests = response.data;
          Utility.closeDialog();
        } else {
          Utility.showSnackbar("${response.message}");
        }
      } else {
        Utility.showSnackbar("No Team found");
      }
    }
  }

  void requestMatch(String teamId) async {
    Utility.showLoadingDialog();
    RequestMatch response = await api.requestMatch(teamId, matchId!);
    if (response.data != null) {
      update();
      Utility.closeDialog();
    } else {
      Utility.showSnackbar("${response.message}");
    }
  }

  void updateRequest(
      BuildContext context, int? id, String? matchId, String? status) async {
    Utility.showLoadingDialog();

    UpdateMatchRequestsByTeam response =
        await api.updateMatchRequestsByTeam(id, matchId, status);
    if (response.data != null) {
      Utility.closeDialog();
      Utility.showSnackbar("${response.message}");
      Get.back();
    } else {
      Utility.closeDialog();

      Utility.showSnackbar("${response.message}");
      Get.back();
    }
  }

  void upcomingMatch() async {
    Utility.showLoadingDialog();
    String date = DateTime.now().year.toString() +
        '-' +
        DateTime.now().month.toString() +
        '-' +
        DateTime.now().day.toString();
    UpcomingMatches response = await api.upcomingMatches(date);
    if (response.data != null) {
      upcomingMatchesList = response.data;
      print(upcomingMatchesList);
      Utility.closeDialog();
      Utility.showSnackbar("${response.message}");
    } else {
      Utility.closeDialog();
      Utility.showSnackbar("${response.message}");
    }
  }
}
