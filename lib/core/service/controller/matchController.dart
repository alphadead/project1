import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:vamos/core/models/genericResponse.dart';
import 'package:vamos/core/models/match/matchListResponse.dart';
import 'package:vamos/core/models/match/matchRequest.dart';
import 'package:vamos/core/models/match/matchRequestRecvdByTeam.dart';
import 'package:vamos/core/models/match/teamRequestSentByMatch.dart';
import 'package:vamos/core/models/match/updateMatchRequest.dart';
import 'package:vamos/core/models/match/upcomingMatches.dart';
import 'package:vamos/core/models/playerRequestResponse.dart';
import 'package:vamos/core/models/setup/playerPositionsResponse.dart';
import 'package:vamos/core/service/api/api.dart';
import 'package:vamos/core/service/controller/myTeamController.dart';
import 'package:vamos/core/service/controller/teamListingController.dart';
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
  List<dynamic>? playerPosition;
  List<PlayerData>? playerJoinedList;
  List<Match>? get matches => _matches;
  List<Team>? get teams => _teams;
  List<MatchRequest>? get matchRequests => _matchRequests;
  String? _matchTeamSize = '6';
  Map<int, Map<String, String>> _playersMap = {};
  int? requestId;

  Map<int, Map<String, String>> get playersMap => _playersMap;
  set playersMap(Map<int, Map<String, String>> value) {
    _playersMap = value;
    update();
  }

  String? get matchTeamSize => _matchTeamSize;
  set matchTeamSize(String? value) {
    _matchTeamSize = value;
    update();
  }

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

  void requestMatch(int index, String teamId) async {
    Utility.showLoadingDialog();
    RequestMatch response = await api.requestMatch(teamId, matchId!);
    if (response.data != null) {
      Get.put(TeamListController()).teamList[index].status = 'pending';
      Get.put(TeamListController()).teamList[index].requestId =
          response.data?.id;
      Get.put(TeamListController()).update();
      Utility.closeDialog();
    } else {
      Utility.showSnackbar("${response.message}");
    }
  }

  void updateRequest(int? id, String? matchId, String? status) async {
    Utility.showLoadingDialog();

    UpdateMatchRequestsByTeam response = await api.updateMatchRequestsByTeam(
        id, matchId, status, playersMap.values.toList());
    if (response.success ?? false) {
      Utility.closeDialog();
      Utility.showSnackbar("${response.message}");
      matchRequests?.removeWhere((element) => element.id == requestId);
      Get.back();
      Get.back();
      update();
    } else {
      Utility.closeDialog();
      Utility.showSnackbar("${response.message}");
      Get.back();
      Get.back();
    }
  }

  void upcomingMatch() async {
    Utility.showLoadingDialog();

    String date = DateFormat('yyyy-MM-dd').format(DateTime.now());
    UpcomingMatches response = await api.upcomingMatches(date);
    if (response.data != null) {
      upcomingMatchesList = response.data;
      Utility.closeDialog();
      update();
    } else {
      Utility.closeDialog();
      Utility.showSnackbar("${response.message}");
    }
  }

  void getPlayerPosition() async {
    Utility.showLoadingDialog();
    PlayerPositionsResponse response = await api.getPlayerPosition();
    if (response.success!) {
      playerPosition = response.data!;
      Utility.closeDialog();
      update();
    } else {
      Utility.closeDialog();
      Utility.showSnackbar(response.message!);
    }
  }

  void getPlayerJoinedListByTeam() async {
    Utility.showLoadingDialog();
    SharedPreferences prefs = await SharedPreferences.getInstance();
    int? teamId = prefs.getString("team_id") == null
        ? null
        : int.parse(prefs.getString("team_id").toString());
    PlayerRequestResponse response =
        await api.getPlayerJoinedListByTeam(teamId);
    if (response.data != null) {
      Utility.closeDialog();
      playerJoinedList = response.data!;
    } else {
      Utility.closeDialog();
      Utility.showSnackbar("${response.message}");
    }
    update();
  }

  void selectMatchPlayers({bool incomingRequest = false}) async {
    Utility.showLoadingDialog();
    if (playersMap.values.toList().length < int.parse(matchTeamSize!)) {
      Utility.showSnackbar(
          "Not enough players to complete match creation. Make sure to invite all players");
      return;
    }

    if (incomingRequest) {
      updateRequest(requestId, matchId.toString(), "Accept");
      return;
    }

    SharedPreferences prefs = await SharedPreferences.getInstance();

    int? teamId = prefs.getString("team_id") == null
        ? null
        : int.parse(prefs.getString("team_id").toString());

    GenericResponse response = await api.selectMatchPlayers(
        matchId, teamId, playersMap.values.toList());
    if (response.success ?? false) {
      Utility.closeDialog();
    print(matchId);
      matchId = matchId;
      update();
      Get.toNamed("/inviteTeamMatch");
    } else {
      Utility.showSnackbar("${response.message}");
    }
  }
}
