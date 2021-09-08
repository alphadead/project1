import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:vamos/core/models/genericResponse.dart';
import 'package:vamos/core/models/joinTeam.dart';
import 'package:vamos/core/models/playerListResponse.dart';
import 'package:vamos/core/models/teamListingResponse.dart';
import 'package:vamos/core/service/api/api.dart';
import 'package:vamos/ui/utils/color.dart';
import 'package:vamos/ui/utils/utility.dart';

import '../../../locator.dart';

class PlayerListController extends GetxController {
  List<PlayerData> playerList = [];
  List<PlayerData> playerListDisplay = [];
  late bool apiCall;
  String userType = '';

  List<Color> statusColor = [moneyBox, containerGreen, KRed];

  Api api = locator<Api>();

  void onInit() {
    WidgetsBinding.instance!.addPostFrameCallback((_) => getPlayerlist());
  }

  void getPlayerlist() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    userType = prefs.getString("register_type")!;
    Utility.showLoadingDialog();
    PlayerListResponse response = await api.getPlayerlist();
    if (response.data != null) {
      Utility.closeDialog();
      playerList = response.data!;
      playerListDisplay = playerList;
    } else {
      Utility.closeDialog();
      Utility.showSnackbar("${response.message}");
    }
    update();
  }

  void requestPlayer(userId) async {
    Utility.showLoadingDialog();

    SharedPreferences prefs = await SharedPreferences.getInstance();

    String? teamId = prefs.getString("team_id");
    if (teamId != null && teamId != "") {
      JoinTeamResponse response =
          await api.requestPlayer(userId, int.parse(teamId));

      if (!response.success) {
        Utility.showSnackbar("${response.message}");
      } else {
        Utility.closeDialog();
      }
    } else {
      Utility.showSnackbar("First Create a Team!!");
    }
  }

  Future<bool> cancelPlayerRequest(userId) async {
    Utility.showLoadingDialog();
    SharedPreferences prefs = await SharedPreferences.getInstance();

    String? teamId = prefs.getString("team_id");

    GenericResponse response = await api.cancelPlayerRequest(teamId, userId);
    if (response.success!) {
      Utility.showSnackbar("${response.message}");
      return true;
    } else {
      Utility.showSnackbar("${response.message}");
      return false;
    }
  }
}
