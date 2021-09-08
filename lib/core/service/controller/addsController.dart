import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AddsController extends GetxController {
  String userType = '';

  List listAdds = [
    Image(image: AssetImage('assets/add.png')),
    Image(image: AssetImage('assets/add.png')),
    Image(image: AssetImage('assets/add.png'))
  ];
}
