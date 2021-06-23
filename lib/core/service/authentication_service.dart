import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:vamos/core/service/api/api.dart';

import '../../locator.dart';

class AuthenticationService extends ChangeNotifier {
  Api api = locator<Api>();
}
