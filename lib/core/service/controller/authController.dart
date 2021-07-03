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
  int id = 0;
  String userId = '';
  String typeOfPlayer = '';
  String position = '';
  String age = '';
  String weight = '';
  String height = '';
  String nationality = '';
  dynamic deletedAt;
  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  GlobalKey<FormState> formKey2 = GlobalKey<FormState>();

  Api api = locator<Api>();

  void login() async {
    Utility.showLoadingDialog();
    SharedPreferences prefs = await SharedPreferences.getInstance();
    LoginResponse response = await api.loginUser(mobileNo, password);
    if (response.data != null) {
      Utility.closeDialog();
      Utility.showError("${response.message}");

      Get.offNamed("/testScreen");
    } else {
      Utility.closeDialog();
      Utility.showError("${response.message}");
    }
  }

  void registerStep() async {
    Utility.showLoadingDialog();
    RegisterResponse response = await api.registerStep(
        firstName, lastName, email, mobileNo, civilId, "Player");
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
    Profile response = await api.profileResponse(
        id, userId, typeOfPlayer, position, age, weight, height, nationality);
    if (response.success) {
      Utility.closeDialog();
      Utility.showError("${response.message}");
    } else {
      Utility.closeDialog();
      Utility.showError("${response.message}");
    }
  }
}
