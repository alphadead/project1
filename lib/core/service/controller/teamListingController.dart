import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:vamos/core/models/acceptRejectResponse.dart';
import 'package:vamos/core/models/genericResponse.dart';
import 'package:vamos/core/models/team/joinTeam.dart';
import 'package:vamos/core/models/team/joinedTeamListResponse.dart';
import 'package:vamos/core/models/team/teamListingResponse.dart';
import 'package:vamos/core/models/team/teamRequestReceviedAsPlayerResponse.dart';
import 'package:vamos/core/service/api/api.dart';
import 'package:vamos/ui/utils/utility.dart';

import '../../../locator.dart';

class TeamListController extends GetxController {
  List<TeamData> teamList = [];
  List<JoinedTeamData>? joinedTeamList = [];
  List<Datum> teamRequestList = [];
  Api api = locator<Api>();
  bool joinedTeam = false;
  String userType = '';

  void getteamlist() async {
    Utility.showLoadingDialog();
    SharedPreferences prefs = await SharedPreferences.getInstance();
    userType = prefs.getString("register_type")!;
    TeamListResponse response = await api.getteamlist();
    if (response.data != null) {
      Utility.closeDialog();

      teamList = response.data!;
    } else {
      Utility.showSnackbar("${response.message}");
    }
    update();
  }

  void joinTeam(teamId) async {
    JoinTeamResponse response = await api.joinTeam(teamId);
    if (response.success) {
      Utility.showSnackbar("${response.message}");
      joinedTeam = true;
    }
  }

  Future<bool> cancelTeamRequest(teamId) async {
    Utility.showLoadingDialog();

    GenericResponse response = await api.cancelTeamRequest(teamId);
    if (response.success!) {
      Utility.showSnackbar("${response.message}");
      return true;
    } else {
      Utility.showSnackbar("${response.message}");
      return false;
    }
  }

  void requestRecived() async {
    Utility.showLoadingDialog();
    TeamRequestReceivedAsPlayerResponse response = await api.requestRecived();
    if (response.status == "Success") {
      teamRequestList = response.data!;
      Utility.showSnackbar("${response.message}");
    } else {
      Utility.showSnackbar("${response.message}");
    }
    update();
  }

  void requestAcceptReject(id, status) async {
    Utility.showLoadingDialog();
    AcceptRejectRequestResponse response =
        await api.requestAcceptReject(id, status);
    if (response.success == "true") {
      Utility.showSnackbar("${response.message}");
    } else {
      Utility.showSnackbar("${response.message}");
    }
    update();
  }

  void getJoinedTeams() async {
    Utility.showLoadingDialog();
    JoinedTeamListResponse response = await api.getJoinedTeams();
    if (response.status == "Success") {
      joinedTeamList = response.data;
      Utility.showSnackbar("${response.message}");
    } else {
      Utility.showSnackbar("${response.message}");
    }
    update();
  }

  Future<bool> cancelTeamRequestByMatch(teamId) async {
    Utility.showLoadingDialog();

    GenericResponse response =
        await api.updateTeamRequestsByMatch(teamId, "Cancel");
    if (response.success!) {
      Utility.showSnackbar("${response.message}");
      return true;
    } else {
      Utility.showSnackbar("${response.message}");
      return false;
    }
  }
}
