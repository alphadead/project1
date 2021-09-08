import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AddsController extends GetxController {
  String userType = 'Player';
  @override
  void onInit() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    userType = prefs.getString("register_type")!;
    update();
    // TODO: implement onInit
    super.onInit();
  }

  void getUserType() async {
    WidgetsBinding.instance!.addPostFrameCallback((_) async {
      SharedPreferences prefs = await SharedPreferences.getInstance();
      userType = prefs.getString("register_type")!;
    });
  }

  List listAdds = [
    Image(image: AssetImage('assets/add.png')),
    Image(image: AssetImage('assets/add.png')),
    Image(image: AssetImage('assets/add.png'))
  ];
}
