import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:vamos/core/models/joinTeam.dart';
import 'package:vamos/core/models/playerListResponse.dart';
import 'package:vamos/core/models/teamListingResponse.dart';
import 'package:vamos/core/service/api/api.dart';
import 'package:vamos/ui/utils/utility.dart';

import '../../../locator.dart';

class PlayerListController extends GetxController {
  List<PlayerData> playerList = [];
  List<PlayerData> playerListDisplay = [];

  Api api = locator<Api>();

  void onInit() {
    WidgetsBinding.instance!.addPostFrameCallback((_) => getPlayerlist());
  }

  void getPlayerlist() async {
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

  void joinTeam(int teamId) async {
    JoinTeamResponse response = await api.joinTeam(teamId);
    if (!response.success) {
      Utility.showSnackbar("${response.message}");
    }
  }
}
