import 'package:get/get.dart';
import 'package:vamos/core/models/playerRequestResponse.dart';
import 'package:vamos/core/service/api/api.dart';
import 'package:vamos/locator.dart';
import 'package:vamos/ui/utils/utility.dart';

class MyTeamController extends GetxController {
  List<PlayerData> _playerRequestList = [];
  List<PlayerData> _playerJoinedList = [];

  Api api = locator<Api>();
  List<PlayerData> get playerRequestList => _playerRequestList;
  List<PlayerData> get playerJoinedList => _playerJoinedList;

  set playerRequestList(List<PlayerData> val) {
    _playerRequestList = val;
    update();
  }

  set playerJoinedList(List<PlayerData> val) {
    _playerJoinedList = val;
    update();
  }

  void getPlayerRequestListByTeam(int teamId) async {
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

  void getPlayerJoinedListByTeam(int teamId) async {
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
}
