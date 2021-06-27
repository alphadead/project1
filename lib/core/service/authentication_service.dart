import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:vamos/core/models/loginResponse.dart';

import 'package:vamos/core/service/api/api.dart';
import 'package:vamos/core/service/loader_service.dart';
import 'package:vamos/ui/loginPages/register.dart';
import 'package:vamos/ui/shared/snackbars.dart';

import '../../locator.dart';

class AuthenticationService extends ChangeNotifier {
  late LoginResponse _loginResponse;

  String _mobileNo = '';
  String _password = '';

  String get mobileNo => _mobileNo;
  String get password => _password;
  LoginResponse get loginResponse => _loginResponse;

  Api api = locator<Api>();

  set mobileNo(value) {
    _mobileNo = value;
    notifyListeners();
  }

  set password(value) {
    _password = value;
    notifyListeners();
  }

  void login(
      BuildContext context, GlobalKey<ScaffoldState> _loginScreen) async {
    setLoader(context, true);
    SharedPreferences prefs = await SharedPreferences.getInstance();
    LoginResponse response = await api.loginUser(mobileNo, password);
    if (response.status == 'Success') {
      setLoader(context, false);
      showSuccessSnackbar(_loginScreen, "Login done");
      Navigator.push(
          context, MaterialPageRoute(builder: (context) => RegisterPage()));
    } else {
      print("==============");
    }
  }
}
