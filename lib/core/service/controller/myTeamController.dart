import 'package:get/get.dart';
import 'package:vamos/core/models/playerRequestResponse.dart';
import 'package:vamos/core/service/api/api.dart';
import 'package:vamos/locator.dart';
import 'package:vamos/ui/utils/utility.dart';

class MyTeamController extends GetxController {
  List<PlayerData> _playerRequestList = [];
  Api api = locator<Api>();
  List<PlayerData> get playerRequestList => _playerRequestList;

  set playerRequestList(List<PlayerData> val) {
    _playerRequestList = val;
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

}
