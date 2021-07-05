import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:vamos/core/models/loginResponse.dart';
import 'package:vamos/core/models/profile_api.dart';
import 'package:vamos/core/models/registerResponse.dart';
import 'package:vamos/core/service/api/api.dart';
import 'package:vamos/ui/utils/utility.dart';

import '../../../locator.dart';

class AuthController extends GetxController {
  String mobileNo = '';
  String password = '';
  String firstName = '';
  String lastName = '';
  String email = '';
  String civilId = '';
  String address = '';
  String userId = '';
  String typeOfPlayer = '';
  String position = '';
  String age = '';
  String weight = '';
  String height = '';
  String nationality = '';

  String type = '';
  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  GlobalKey<FormState> formKey2 = GlobalKey<FormState>();

  Api api = locator<Api>();

  void login() async {
    Utility.showLoadingDialog();
    SharedPreferences prefs = await SharedPreferences.getInstance();
    LoginResponse response = await api.loginUser(mobileNo, password);
    if (response.data != null) {
      prefs.setString('token', 'Bearer ${response.accessToken}');
      prefs.setString('userId', '${response.data!.id}');
      Utility.closeDialog();
      Utility.showError("${response.message}");

      Get.offNamed("/registeredTeamScreen");
    } else {
      Utility.closeDialog();
      Utility.showError("${response.message}");
    }
  }

  void registerStep() async {
    Utility.showLoadingDialog();
    RegisterResponse response = await api.registerStep(
        firstName, lastName, email, mobileNo, civilId, type);
    if (response.success) {
      Utility.closeDialog();
      Utility.showError("${response.message}");
    } else {
      Utility.closeDialog();
      Utility.showError("${response.message}");
    }
  }

  void profile() async {
    Utility.showLoadingDialog();
    SharedPreferences prefs = await SharedPreferences.getInstance();
    userId = prefs.getString("userId")!;

    ProfileResponse response = await api.profileResponse(
        userId, typeOfPlayer, position, age, weight, height, nationality);
    if (response.success) {
      Utility.closeDialog();
      Utility.showError("${response.message}");
    } else {
      Utility.closeDialog();
      Utility.showError("${response.message}");
    }
  }
}
