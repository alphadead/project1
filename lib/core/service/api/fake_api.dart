import 'package:vamos/core/models/loginResponse.dart';
import 'package:vamos/core/service/api/api.dart';

class FakeApi extends Api {
  Future<LoginResponse> loginUser(String mobileNo, String password) {
    throw UnimplementedError();
  }
}
