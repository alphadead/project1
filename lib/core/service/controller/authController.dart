import 'dart:io';

import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:vamos/core/models/completeStepResponse.dart';
import 'package:vamos/core/models/createTeamResponse.dart';
import 'package:vamos/core/models/deleteMedia.dart';
import 'package:vamos/core/models/loginResponse.dart';
import 'package:vamos/core/models/profile_api.dart';
import 'package:vamos/core/models/registerResponse.dart';
import 'package:vamos/core/models/verifyOtpResponse.dart';
import 'package:vamos/core/service/api/api.dart';
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
  String address = '';
  String userId = '';
  String typeOfPlayer = '';
  String position = '';
  String age = '';
  String weight = '';
  String height = '';
  String nationality = '';
  String otp = '';
  String inviteCode = '';
  String? nickName;

  String type = '';
  List<Asset> images = [];
  List networkImages = [];
  bool addImageButton = true;
  bool addVideoButton = true;
  int maxImage = 4;
  String _error = 'No Error Dectected';
  int selectedVideo = 0;

  List<File> files = [];
  List networkFiles = [];
  FilePickerResult? result;

  String teamName = '';
  List<Asset> teamLogo = [];
  String teamSize = '';

  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  GlobalKey<FormState> formKey2 = GlobalKey<FormState>();

  Api api = locator<Api>();

  void login() async {
    Utility.showLoadingDialog();
    SharedPreferences prefs = await SharedPreferences.getInstance();
    LoginResponse response = await api.loginUser(mobileNo, password);
    print(response.toJson().toString());
    if (response.data != null) {
      prefs.setString('token', 'Bearer ${response.accessToken}');
      prefs.setString('userId', '${response.data!.id}');
      prefs.setString('invite_code', '${response.data!.inviteCode}');
      prefs.setString("completedStep", '${response.data!.completedStep}');
      prefs.setBool('isAuthenticated', true);
      Utility.closeDialog();
      otp = response.data!.otp!;
      mobileNo = response.data!.phone!;
      update();
      Utility.showSnackbar("${response.message}");
      if (response.data!.isVerified == "0") {
        Get.offNamed('/setPass');
      } else {
        if (response.data!.completedStep == "1") {
          Get.offNamed('/profileScreen');
        } else if (response.data!.completedStep == "2") {
          Get.offNamed("/registeredTeamScreen");
        } else if (response.data!.completedStep == "3") {
          Get.offNamed("/inviteScreen");
        } else if (response.data!.completedStep == "4") {
          Get.offNamed("/homeScreen");
        } else {
          Get.offNamed("/login");
        }
      }
    } else {
      Utility.showSnackbar("${response.message}");
    }
  }

  void createTeam() async {
    Utility.showLoadingDialog();
    SharedPreferences prefs = await SharedPreferences.getInstance();
    CreateTeamResponse response =
        await api.createTeam(teamName, teamLogo[0], teamSize);
    if (response.success) {
      Utility.showSnackbar("${response.message}");

      Get.offNamed('/playerListingScreen');
    } else {
      Utility.showSnackbar("${response.message}");
    }
  }

  void registerStep() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    Utility.showLoadingDialog();
    RegisterResponse response = await api.registerStep(
        firstName, lastName, email, mobileNo, type, password, address);
    if (response.success) {
      Utility.showSnackbar("${response.message}");
      prefs.setString('token', 'Bearer ${response.accessToken}');
      prefs.setString('userId', '${response.data!.id}');
      prefs.setString('invite_code', '${response.data!.inviteCode}');
      otp = response.data!.otp.toString();
      update();
      Get.offNamed('/setPass');
    } else {
      Utility.showSnackbar("${response.message}");
    }
  }

  void completedStep(String step, String nextRoute) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    Utility.showLoadingDialog();
    CompletedStepResponse response = await api.completedtep(step);
    if (response.success!) {
      Utility.showSnackbar("${response.message}");
      prefs.setString("completedStep", step);
      Get.toNamed(nextRoute);
    } else {
      Utility.showSnackbar("${response.message}");
    }
  }

  Future<void> loadAssets({bool isSingleImage = false}) async {
    List<Asset> resultList = <Asset>[];
    List<Asset> selectedImage = <Asset>[];

    String error = 'No Error Detected';

    try {
      resultList = await MultiImagePicker.pickImages(
        maxImages: !isSingleImage ? maxImage - images.length : 1,
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
      Utility.showSnackbar(e.toString());
    }

    !isSingleImage ? images.addAll(resultList) : teamLogo = resultList;
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

  Future<void> loadVideo() async {
    List<File> tempVideo = [];
    FilePickerResult? result = await FilePicker.platform.pickFiles(
        allowMultiple: true, type: FileType.custom, allowedExtensions: ['mp4']);
    if (result != null) {
      tempVideo = result.paths.map((path) => File(path!)).toList();
    } else {
      // User canceled the picker
    }

    if (files.length + tempVideo.length <= 2) {
      files.addAll(tempVideo);
      if (files.length >= 2) {
        addVideoButton = false;
      }
    } else {
      tempVideo = [];
      Utility.showSnackbar("Select only 2 videos");
    }

    update();
  }

  Future<void> deleteVideoFile(int index) async {
    files.removeAt(index);
    addVideoButton = true;
    update();
  }

  void verifyOtp() async {
    Utility.showLoadingDialog();
    SharedPreferences prefs = await SharedPreferences.getInstance();
    userId = prefs.getString("userId")!;
    VerifyOtpResponse response = await api.verifyOtp(userId, mobileNo, otp);
    if (response.success!) {
      Utility.showSnackbar("${response.message}");
      completedStep("1", "/profileScreen");
    } else {
      Utility.showSnackbar("${response.message}");
    }
  }

  Future<void> deleteMedia(int index, String mediaType) async {
    String mediaId;
    if (mediaType == 'image')
      mediaId = networkImages[index]["id"].toString();
    else
      mediaId = networkFiles[index]["id"].toString();

    Utility.showLoadingDialog();
    DeleteMedia response = await api.deleteMedias(mediaId);

    if (response.success!) {
      Utility.showSnackbar("${response.message}");
      if (mediaType == 'image')
        networkImages.removeAt(index);
      else
        networkFiles.removeAt(index);
    } else {
      Utility.showSnackbar("${response.message}");
    }
    update();
  }
}
