import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:vamos/core/models/profileDataResponse.dart';
import 'package:vamos/core/models/profile_api.dart';
import 'package:vamos/core/service/controller/authController.dart';
import 'package:vamos/locator.dart';
import 'package:vamos/ui/utils/utility.dart';
import 'package:vamos/core/service/api/api.dart';
import 'package:vamos/core/models/teamListingResponse.dart';

class ProfileController extends GetxController {
  String? weight;

  Api api = locator<Api>();
  void onInit() async {
    WidgetsBinding.instance!.addPostFrameCallback((_) => getProfileData());
  }

  int? getWeight() {
    print("Weiaght" + weight.toString());
    return weight == null ? null : int.parse(weight.toString());
  }

  void getProfileData() async {
    Utility.showLoadingDialog();
    SharedPreferences prefs = await SharedPreferences.getInstance();
    print("ID" + prefs.getString("userId").toString());
    ProfileDataResponse response =
        await api.getProfile(prefs.getString("userId").toString());
    if (response.data != null) {
      Utility.closeDialog();
      weight = response.data?.weight;
      print("BBBBBBBBBBBBB");
      print(weight);
      //Copy to controller variables
    } else {
      if (prefs.getString("completedStep") == "2") {
        Utility.showSnackbar("${response.message}");
      } else {
        Utility.closeDialog();
      }
    }
    update();
  }

  void profile() async {
    AuthController controller = Get.find();
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
        controller.images,
        controller.files);
    if (response.success) {
      Utility.showSnackbar("${response.message}");
      controller.completedStep("2", "/registeredTeamScreen");
    } else {
      Utility.showSnackbar("${response.message}");
    }
  }
}
