import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:vamos/core/models/profileDataResponse.dart';
import 'package:vamos/core/models/profile_api.dart';
import 'package:vamos/core/models/referalEarning.dart';
import 'package:vamos/core/service/api/api.dart';
import 'package:vamos/core/service/controller/authController.dart';
import 'package:vamos/locator.dart';
import 'package:vamos/ui/utils/utility.dart';

class ProfileController extends GetxController {
  ProfileData? profile;
  int? mediaId;
  Referal? referals;
  Api api = locator<Api>();

  // void onInit() async {
  //   super.onInit();
  //   WidgetsBinding.instance!.addPostFrameCallback((_) => getProfileData());
  // }

  void getProfileData() async {
    Utility.showLoadingDialog();
    SharedPreferences prefs = await SharedPreferences.getInstance();
    ProfileDataResponse response =
        await api.getProfile(prefs.getString("userId").toString());
    if (response.data != null) {
      profile = response.data;
      prefs.setString('team_id', '${response.data!.teamId}');
      update();
      Utility.closeDialog();
    }
    // } else {
    //   if (prefs.getString("completedStep") == "2") {
    //     Utility.showSnackbar("${response.message}");
    //   } else {
    //     Utility.closeDialog();
    //   }
    // }
    update();
  }

  void updateProfile({required bool argument}) async {
    AuthController controller = Get.find<AuthController>();
    Utility.showLoadingDialog();

    SharedPreferences prefs = await SharedPreferences.getInstance();
    controller.userId = prefs.getString("userId")!;
    // postProfile(images);

    ProfileResponse response = await api.profileResponse(
        controller.userId,
        controller.typeOfPlayer,
        controller.position,
        controller.age,
        controller.weight,
        controller.height,
        controller.nationality,
        controller.nickName,
        controller.images,
        controller.files);
    if (response.success) {
      Utility.showSnackbar("${response.message}");
      if (argument) {
        Get.offAllNamed("/playerInfo");
      } else {
        Get.find<AuthController>().completedStep("2", "/registeredTeamScreen");
      }
    } else {
      Utility.showSnackbar("${response.message}");
    }
  }

  void getReferral() async {
    Utility.showLoadingDialog();

    ReferalEarning response = await api.getEarning();

    print(response.toString());
    if (response.data != null) {
      referals = response.data;
      update();
      Utility.closeDialog();
    } else {
      Utility.showSnackbar("${response.message}");
    }
  }
}