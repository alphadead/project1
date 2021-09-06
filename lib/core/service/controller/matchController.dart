import 'package:get/get.dart';
import 'package:vamos/core/models/match/matchListResponse.dart';
import 'package:vamos/core/models/match/matchRequest.dart';
import 'package:vamos/core/service/api/api.dart';
import 'package:vamos/locator.dart';
import 'package:vamos/ui/utils/utility.dart';

class MatchController extends GetxController {
  int? matchId;
  String? teamId;
  Api api = locator<Api>();
  List<Match>? _matches;

  List<Match>? get matches => _matches;

  set matches(List<Match>? value) {
    _matches = value;
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

  void requestMatch(String teamId) async {
    Utility.showLoadingDialog();
    RequestMatch response = await api.requestMatch(teamId, matchId!);
    if (response.data != null) {
      update();
      Utility.closeDialog();
    } else {
      Utility.showSnackbar("${response.message}");
    }
  }
}
