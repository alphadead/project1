import 'package:vamos/core/models/loginResponse.dart';
import 'package:vamos/core/models/registerResponse.dart';

abstract class Api {
  Future<LoginResponse> loginUser(String mobileNo, String password);
  Future<RegisterResponse> registerStep(String firstName, String lastName,
      String email, String mobileNo, String civilId, String type);
}
