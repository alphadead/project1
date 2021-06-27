import 'package:vamos/core/models/loginResponse.dart';
import 'package:vamos/core/service/api/api.dart';
import 'package:vamos/core/service/api/request.dart';

class HTTPApi extends Api {
  Future<LoginResponse> loginUser(String mobileNo, String password) async {
    Map<String, dynamic> body = {"phone": mobileNo, "password": password};
    Map<String, dynamic> response = await postRequest("login", body);
    return LoginResponse.fromJson(response);
  }
}
