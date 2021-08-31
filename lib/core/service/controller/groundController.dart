import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:vamos/core/models/updateGround.dart';
import 'package:vamos/core/service/api/api.dart';
import 'package:vamos/locator.dart';
import 'package:vamos/ui/utils/utility.dart';

class GroundController extends GetxController {
  Api api = locator<Api>();
  GroundInfo? groundInfo;
  GroundInfo? groundDisplay;

  String? groundName;
  String? groundLocation;
  String? bookingFees;

  void groundUpdate() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    Utility.showLoadingDialog();
    print('+++++++++++++++AAAAAAAAAAAAAAAAAAAAA');
    UpdateGround response = await api.updateGround(
        prefs.getString("userId").toString(),
        groundName,
        groundLocation,
        bookingFees);
    print(response.toString());
    print('+++++++++++++++AAAAAAAAAAAAAAAAAAAAA');
    if (response.data != null) {
      Utility.closeDialog();
      groundInfo = response.data!;
      groundDisplay = groundInfo;
    } else {
      Utility.closeDialog();
      Utility.showSnackbar("${response.message}");
    }
    update();
  }
}
