import 'package:get/get.dart';

import 'package:vamos/core/models/profileDataResponse.dart';

import 'package:vamos/core/service/api/api.dart';

import 'package:vamos/ui/utils/utility.dart';

import '../../../locator.dart';

class OtherPlayerInfoController extends GetxController {
  ProfileData? profile;

  Api api = locator<Api>();

  void getProfileData(String userId) async {
    Utility.showLoadingDialog();

    ProfileDataResponse response = await api.getProfile(userId);
    if (response.data != null) {
      profile = response.data;
      update();
      Utility.closeDialog();
      Get.toNamed("/otherPlayerInfo");
    } else {
      Utility.closeDialog();
    }

    update();
  }
}
