import 'package:vamos/core/models/loginResponse.dart';
import 'package:vamos/core/models/profile_api.dart';
import 'package:vamos/core/models/registerResponse.dart';
import 'package:vamos/core/service/api/api.dart';

class FakeApi extends Api {
  Future<LoginResponse> loginUser(String mobileNo, String password) {
    throw UnimplementedError();
  }

  Future<RegisterResponse> registerStep(String firstName, String lastName,
      String email, String mobileNo, String civilId, String type) {
    throw UnimplementedError();
  }

  Future<Profile> profileResponse(
    int id,
    String userId,
    String typeOfPlayer,
    String position,
    String age,
    String weight,
    String height,
    String nationality,
  ) {
    throw UnimplementedError();
  }
}
