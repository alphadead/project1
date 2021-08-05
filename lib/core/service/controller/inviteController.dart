import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:share/share.dart';
import 'package:shared_preferences/shared_preferences.dart';

class InviteController extends GetxController {
  void onInit() {
    WidgetsBinding.instance!.addPostFrameCallback((_) => setInviteCode());
  }

  String inviteCode = '';
  onShare() async {
    await Share.share(inviteCode);
  }

  setInviteCode() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    inviteCode = prefs.getString("invite_code")!;
    update();
  }
}
