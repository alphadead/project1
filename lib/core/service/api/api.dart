import 'package:vamos/core/models/loginResponse.dart';

abstract class Api {
  Future<LoginResponse> loginUser(String mobileNo, String password);
}
