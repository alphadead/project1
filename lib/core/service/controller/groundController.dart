import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:vamos/core/models/groundProfileView.dart';
import 'package:vamos/core/models/updateGround.dart';
import 'package:vamos/core/service/api/api.dart';
import 'package:vamos/locator.dart';
import 'package:vamos/ui/utils/utility.dart';

class GroundController extends GetxController {
  Api api = locator<Api>();
  String? groundName;
  String? groundLocation;
  late String _bookingFee;

  String get bookingFee => _bookingFee;

  set bookingFee(String value) {
    _bookingFee = value;
    update();
  }

  String? latitude;
  String? longitude;
  String? bookingFees;
  List? photos;
  GroundInfo? groundInfo;
  GroundInfo? groundDisplay;

  void getProfileData() async {
    Utility.showLoadingDialog();
    SharedPreferences prefs = await SharedPreferences.getInstance();
    GroundProfileViewResponse response = await api.getGroundProfile("7");
    if (response.data != null) {
      groundName = response.data?.name;
      groundLocation = response.data?.location;
      latitude = response.data?.latitude;
      longitude = response.data?.longitude;
      bookingFees = response.data?.bookingFee;
      photos = response.data?.photo;
      update();
      Utility.closeDialog();
    }
  }

  void groundUpdate() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    Utility.showLoadingDialog();
    print('+++++++++++++++AAAAAAAAAAAAAAAAAAAAA');
    UpdateGround response = await api.updateGround(
        prefs.getString("userId").toString(),
        groundName,
        groundLocation,
        bookingFee);
    print(response.toString());
    print('+++++++++++++++AAAAAAAAAAAAAAAAAAAAA');
    if (response.data != null) {
      Utility.closeDialog();
      groundInfo = response.data!;
      groundDisplay = groundInfo;
      Get.offNamed("/homeScreen");
    } else {
      Utility.closeDialog();
      Utility.showSnackbar("${response.message}");
    }
    update();
  }
}
