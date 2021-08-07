import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:vamos/core/models/joinTeam.dart';
import 'package:vamos/core/models/teamListingResponse.dart';
import 'package:vamos/core/service/api/api.dart';
import 'package:vamos/ui/utils/utility.dart';

import '../../../locator.dart';

class TeamListController extends GetxController {
  List<TeamData> teamList = [];
  Api api = locator<Api>();

  void onInit() {
    WidgetsBinding.instance!.addPostFrameCallback((_) => getteamlist());
  }

  void getteamlist() async {
    Utility.showLoadingDialog();
    TeamListResponse response = await api.getteamlist();
    if (response.data != null) {
      Utility.closeDialog();
      teamList = response.data!;
      Utility.showError("${response.message}");
    } else {
      Utility.closeDialog();
      Utility.showError("${response.message}");
    }
    update();
  }

  void joinTeam(int teamId) async {
    JoinTeamResponse response = await api.joinTeam(teamId);
    if (response.success) {
      Utility.closeDialog();
      Utility.showError("${response.message}");
      Get.offNamed("/inviteScreen");
    } else {
      Utility.closeDialog();
      Utility.showError("${response.message}");
    }
  }
}
