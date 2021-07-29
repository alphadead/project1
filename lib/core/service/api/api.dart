import 'dart:io';

import 'package:multi_image_picker2/multi_image_picker2.dart';
import 'package:vamos/core/models/loginResponse.dart';
import 'package:vamos/core/models/profile_api.dart';
import 'package:vamos/core/models/registerResponse.dart';
import 'package:vamos/core/models/teamListingResponse.dart';
import 'package:vamos/core/models/verifyOtpResponse.dart';

abstract class Api {
  Future<LoginResponse> loginUser(String mobileNo, String password);
  Future<RegisterResponse> registerStep(
      String firstName,
      String lastName,
      String email,
      String mobileNo,
      String type,
      String password,
      String address);
  Future<ProfileResponse> profileResponse(
      String userId,
      String typeOfPlayer,
      String position,
      String age,
      String weight,
      String height,
      String nationality,
      List<Asset> images,
      List<File> files);

  Future<TeamListResponse> getteamlist();
  Future<VerifyOtpResponse> verifyOtp(userId, mobileNo, otp);
}
