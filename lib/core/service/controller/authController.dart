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
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  Api api = locator<Api>();

  void login() async {
    Utility.showLoadingDialog();
    SharedPreferences prefs = await SharedPreferences.getInstance();
    LoginResponse response = await api.loginUser(mobileNo, password);
    if (response.status == 'Success') {
      Utility.closeDialog();
      Utility.showError("Login DOne");
      // Get.offNamed("/testScreen");
    } else {
      print("==============");
    }
  }
}
