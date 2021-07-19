import 'dart:typed_data';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:vamos/core/models/loginResponse.dart';
import 'package:vamos/core/models/profile_api.dart';
import 'package:vamos/core/models/registerResponse.dart';
import 'package:vamos/core/service/api/api.dart';
import 'package:vamos/core/service/api/request.dart';
import 'package:vamos/ui/utils/utility.dart';

import '../../../locator.dart';
import 'package:multi_image_picker2/multi_image_picker2.dart';
import 'dart:async';

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
  List<Asset> images = [];
  bool addImageButton = true;
  int maxImage = 4;
  String _error = 'No Error Dectected';

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

      Get.offNamed('/registeredTeamScreen');
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
      Get.toNamed("/registeredTeamScreen");
    } else {
      Utility.closeDialog();
      Utility.showError("${response.message}");
    }
  }

  void profile() async {
    Utility.showLoadingDialog();

    SharedPreferences prefs = await SharedPreferences.getInstance();
    userId = prefs.getString("userId")!;
    // postProfile(images);

    ProfileResponse response = await api.profileResponse(userId, typeOfPlayer,
        position, age, weight, height, nationality, images);
    if (response.success) {
      Utility.closeDialog();
      Utility.showError("${response.message}");
      Get.toNamed("/upcomingmatches");
    } else {
      Utility.closeDialog();
      Utility.showError("${response.message}");
    }
  }

  Future<void> loadAssets() async {
    List<Asset> resultList = <Asset>[];
    List<Asset> selectedImage = <Asset>[];

    String error = 'No Error Detected';

    try {
      resultList = await MultiImagePicker.pickImages(
        maxImages: maxImage - images.length,
        enableCamera: true,
        selectedAssets: selectedImage,
        cupertinoOptions: CupertinoOptions(
          takePhotoIcon: "Vamos",
          doneButtonTitle: "Done",
        ),
        materialOptions: MaterialOptions(
          actionBarTitle: "Vamos App",
          useDetailsView: true,
        ),
      );
    } on Exception catch (e) {
      Utility.showError(e.toString());
    }

    images.addAll(resultList);
    update();
    _error = error;
    if (images.length == maxImage) {
      addImageButton = false;
      update();
    }
  }

  Future<void> deleteFile(int index) async {
    images.removeAt(index);
    addImageButton = true;
    update();
  }
}
