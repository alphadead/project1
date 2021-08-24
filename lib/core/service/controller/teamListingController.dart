import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:vamos/core/models/genericResponse.dart';
import 'package:vamos/core/models/joinTeam.dart';
import 'package:vamos/core/models/teamListingResponse.dart';
import 'package:vamos/core/service/api/api.dart';
import 'package:vamos/ui/utils/utility.dart';

import '../../../locator.dart';

class TeamListController extends GetxController {
  List<TeamData> teamList = [];
  Api api = locator<Api>();
  bool joinedTeam = false;

  void onInit() {
    WidgetsBinding.instance!.addPostFrameCallback((_) => getteamlist());
  }

  void getteamlist() async {
    Utility.showLoadingDialog();
    TeamListResponse response = await api.getteamlist();
    if (response.data != null) {
      Utility.closeDialog();

      teamList = response.data!;
      print(teamList);
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
}
