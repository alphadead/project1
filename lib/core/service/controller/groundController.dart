import 'package:get/get.dart';
import 'package:vamos/core/models/updateGround.dart';
import 'package:vamos/core/service/api/api.dart';
import 'package:vamos/locator.dart';
import 'package:vamos/ui/utils/utility.dart';

class GroundController extends GetxController {
  Api api = locator<Api>();
  UpdateGround? groundInfo;
  UpdateGround? groundDisplay;

  String? groundName;
  String? groundLocation;
  String? bookingFees;

  void groundUpdate() async {
    Utility.showLoadingDialog();
    print('+++++++++++++++AAAAAAAAAAAAAAAAAAAAA');
    UpdateGround response =
        await api.updateGround(groundName, groundLocation, bookingFees);
    print(response.toString());
    print('+++++++++++++++AAAAAAAAAAAAAAAAAAAAA');
    if (response.data != null) {
      Utility.closeDialog();
      groundInfo = response.data! as UpdateGround?;
      groundDisplay = groundInfo;
    } else {
      Utility.closeDialog();
      Utility.showSnackbar("${response.message}");
    }
    update();
  }
}
