import 'package:vamos/core/models/loginResponse.dart';
import 'package:vamos/core/models/registerResponse.dart';
import 'package:vamos/core/service/api/api.dart';
import 'package:vamos/core/service/api/request.dart';

class HTTPApi extends Api {
  Future<LoginResponse> loginUser(String mobileNo, String password) async {
    Map<String, dynamic> body = {"phone": mobileNo, "password": password};
    Map<String, dynamic> response = await postRequest("login", body);
    return LoginResponse.fromJson(response);
  }

  Future<RegisterResponse> registerStep(String firstName, String lastName,
      String email, String mobileNo, String civilId, String type) async {
    Map<String, dynamic> body = {
      "phone": mobileNo,
      "first_name": firstName,
      "last_name": lastName,
      "email": email,
      "civil_id": civilId,
      "type": type
    };
    Map<String, dynamic> response = await postRequest("register-step-1", body);
    return RegisterResponse.fromJson(response);
  }
}
