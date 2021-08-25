import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:vamos/core/models/myTeamInfo.dart';
import 'package:vamos/core/models/playerRequestResponse.dart';
import 'package:vamos/core/service/api/api.dart';
import 'package:vamos/locator.dart';
import 'package:vamos/ui/utils/utility.dart';

class MyTeamController extends GetxController {
  TeamInfo? _teamInfo;

  List<PlayerData> _playerRequestList = [];
  List<PlayerData> _playerJoinedList = [];

  Api api = locator<Api>();
  List<PlayerData> get playerRequestList => _playerRequestList;
  List<PlayerData> get playerJoinedList => _playerJoinedList;
  TeamInfo? get teamInfo => _teamInfo;

  void onInit() {
    WidgetsBinding.instance!.addPostFrameCallback((_) => getTeamInfo());
  }

  set playerRequestList(List<PlayerData> val) {
    _playerRequestList = val;
    update();
  }

  set playerJoinedList(List<PlayerData> val) {
    _playerJoinedList = val;
    update();
  }

  set teamInfo(TeamInfo? val) {
    _teamInfo = val;
    update();
  }

  void getPlayerRequestListByTeam() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();

    int? teamId = prefs.getString("team_id") == null
        ? null
        : int.parse(prefs.getString("team_id").toString());
    Utility.showLoadingDialog();
    PlayerRequestResponse response =
        await api.getPlayerRequestListByTeam(teamId);
    if (response.data != null) {
      Utility.closeDialog();

      playerRequestList = response.data!;
    } else {
      Utility.showSnackbar("${response.message}");
    }
    update();
  }

  void getPlayerJoinedListByTeam() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();

    int? teamId = prefs.getString("team_id") == null
        ? null
        : int.parse(prefs.getString("team_id").toString());
    Utility.showLoadingDialog();
    PlayerRequestResponse response =
        await api.getPlayerJoinedListByTeam(teamId);
    if (response.data != null) {
      Utility.closeDialog();

      playerJoinedList = response.data!;
    } else {
      Utility.showSnackbar("${response.message}");
    }
    update();
  }

  void getTeamInfo() async {
    Utility.showLoadingDialog();
    MyTeamInfo response = await api.myTeamInfo();
    if (response.data != null) {
      Utility.closeDialog();
      teamInfo = response.data!;
      getPlayerJoinedListByTeam();
    } else {
      teamInfo = response.data;
      Utility.showSnackbar("Please Create a Team and Continue.");
    }
  }
}
