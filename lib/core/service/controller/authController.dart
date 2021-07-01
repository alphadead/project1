import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:vamos/core/models/loginResponse.dart';
import 'package:vamos/core/service/api/api.dart';
import 'package:vamos/ui/utils/utility.dart';

import '../../../locator.dart';

class AuthController extends GetxController {
  String mobileNo = '';
  String password = '';
  GlobalKey<FormState> formKey = GlobalKey<FormState>();

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
}
