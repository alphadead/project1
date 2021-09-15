import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:vamos/core/models/genericResponse.dart';
import 'package:vamos/core/models/groundList.dart';
import 'package:vamos/core/models/joinTeam.dart';
import 'package:vamos/core/models/playerListResponse.dart';
import 'package:vamos/core/models/teamListingResponse.dart';
import 'package:vamos/core/service/api/api.dart';
import 'package:vamos/ui/utils/color.dart';
import 'package:vamos/ui/utils/utility.dart';

import '../../../locator.dart';

class SearchByController extends GetxController {
  List<PlayerData> playerList = [];
  List<PlayerData> playerListDisplay = [];
  late bool apiCall;
  String userType = '';
  List<Grounds> _groundList = [];

  Api api = locator<Api>();

  List<Grounds> get groundList => _groundList;
  set groundList(List<Grounds> value) {
    _groundList = value;
    update();
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

  void getGroundlist() async {
    Utility.showLoadingDialog();
    GroundList response = await api.getGroundlist();
    if (response.data != null) {
      Utility.closeDialog();

      groundList = response.data!;
      update();
    } else {
      Utility.closeDialog();
      Utility.showSnackbar("${response.message}");
    }
    update();
  }
}
