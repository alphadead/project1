import 'package:get/get.dart';
import 'package:vamos/core/models/matchRequest.dart';
import 'package:vamos/core/service/api/api.dart';
import 'package:vamos/locator.dart';
import 'package:vamos/ui/utils/utility.dart';

class MatchController extends GetxController {
  int? matchId;
  String? teamId;
  Api api = locator<Api>();
  void requestMatch() async {
    Utility.showLoadingDialog();
    RequestMatch response = await api.requestMatch(teamId!, matchId!);
    if (response.data != null) {
      update();
      Utility.closeDialog();
    } else {
      Utility.showSnackbar("${response.message}");
    }
  }
}
