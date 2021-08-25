import 'dart:io';

import 'package:multi_image_picker2/multi_image_picker2.dart';
import 'package:vamos/core/models/acceptRejectResponse.dart';
import 'package:vamos/core/models/completeStepResponse.dart';
import 'package:vamos/core/models/createTeamResponse.dart';
import 'package:vamos/core/models/deleteMedia.dart';
import 'package:vamos/core/models/genericResponse.dart';
import 'package:vamos/core/models/joinTeam.dart';
import 'package:vamos/core/models/loginResponse.dart';
import 'package:vamos/core/models/playerListResponse.dart';
import 'package:vamos/core/models/playerRequestResponse.dart';
import 'package:vamos/core/models/profileDataResponse.dart';
import 'package:vamos/core/models/profile_api.dart';
import 'package:vamos/core/models/registerResponse.dart';
import 'package:vamos/core/models/teamListingResponse.dart';
import 'package:vamos/core/models/teamRequestReceviedAsPlayerResponse.dart';
import 'package:vamos/core/models/verifyOtpResponse.dart';
import 'package:vamos/core/service/api/api.dart';
import 'package:vamos/core/service/api/request.dart';

class HTTPApi extends Api {
  Future<LoginResponse> loginUser(String mobileNo, String password) async {
    Map<String, dynamic> body = {"phone": mobileNo, "password": password};
    Map<String, dynamic> response = await postRequest("login", body);
    return LoginResponse.fromJson(response);
  }

  Future<CreateTeamResponse> createTeam(
      String name, Asset logo, String teamSize) async {
    Map<String, dynamic> response =
        await createTeamRequest("team/store", name, logo, teamSize);
    return CreateTeamResponse.fromJson(response);
  }

  Future<RegisterResponse> registerStep(
      String firstName,
      String lastName,
      String email,
      String mobileNo,
      String type,
      String password,
      String address) async {
    Map<String, dynamic> body = {
      "phone": mobileNo,
      "first_name": firstName,
      "last_name": lastName,
      "email": email,
      "type": type,
      "password": password
    };
    Map<String, dynamic> response = await postRequest("register", body);
    return RegisterResponse.fromJson(response);
  }

  Future<ProfileResponse> profileResponse(
      String userId,
      String typeOfPlayer,
      String position,
      String age,
      String weight,
      String height,
      String nationality,
      String? nickName,
      List<Asset> images,
      List<File> files) async {
    Map<String, dynamic> reponse = await postProfileData(
        "profile/update",
        userId,
        typeOfPlayer,
        position,
        age,
        weight,
        height,
        nationality,
        nickName,
        images,
        files);
    return ProfileResponse.fromJson(reponse);
  }

  Future<TeamListResponse> getteamlist() async {
    Map<String, dynamic> response = await getRequest('team');
    return TeamListResponse.fromJson(response);
  }

  Future<ProfileDataResponse> getProfile(String userId) async {
    Map<String, dynamic> response =
        await getRequest('profile?user_id=' + userId);
    return ProfileDataResponse.fromJson(response);
  }

  Future<JoinTeamResponse> joinTeam(int teamId) async {
    Map<String, dynamic> body = {
      "team_id": teamId,
    };
    Map<String, dynamic> response = await postRequest('team/request', body);
    return JoinTeamResponse.fromJson(response);
  }

  Future<DeleteMedia> deleteMedias(String mediaId) async {
    Map<String, dynamic> body = {
      "media_id": mediaId,
    };
    Map<String, dynamic> response =
        await postRequest('delete-profile-media', body);
    return DeleteMedia.fromJson(response);
  }

  Future<VerifyOtpResponse> verifyOtp(userId, mobileNo, otp) async {
    Map<String, dynamic> body = {
      "phone": mobileNo,
      "user_id": userId,
      "otp": otp,
    };
    Map<String, dynamic> response = await postRequest("verify-otp", body);
    return VerifyOtpResponse.fromJson(response);
  }

  Future<PlayerListResponse> getPlayerlist() async {
    Map<String, dynamic> response = await getRequest('players');
    return PlayerListResponse.fromJson(response);
  }

  @override
  Future<CompletedStepResponse> completedtep(String step) async {
    Map<String, dynamic> body = {"completed_step": step};
    Map<String, dynamic> response = await postRequest("completed-step", body);
    return CompletedStepResponse.fromJson(response);
  }

  Future<JoinTeamResponse> requestPlayer(String userId, int teamId) async {
    Map<String, dynamic> body = {
      "user_id": userId,
      "team_id": teamId,
    };
    Map<String, dynamic> response = await postRequest('player/request', body);
    return JoinTeamResponse.fromJson(response);
  }

  @override
  Future<PlayerRequestResponse> getPlayerRequestListByTeam(int teamId) async {
    Map<String, dynamic> response =
        await getRequest('player/request-received?team_id=$teamId');
    return PlayerRequestResponse.fromJson(response);
  }

  @override
  Future<PlayerRequestResponse> getPlayerJoinedListByTeam(int teamId) async {
    Map<String, dynamic> response =
        await getRequest('player/joined?team_id=$teamId');
    return PlayerRequestResponse.fromJson(response);
  }

  Future<GenericResponse> cancelTeamRequest(teamId) async {
    Map<String, dynamic> body = {
      "team_id": teamId,
    };
    Map<String, dynamic> response =
        await postRequest('team/cancel-request', body);
    return GenericResponse.fromJson(response);
  }

  Future<TeamRequestReceivedAsPlayerResponse> requestRecived() async {
    Map<String, dynamic> response = await getRequest('team/request-received');
    return TeamRequestReceivedAsPlayerResponse.fromJson(response);
  }

  Future<AcceptRejectRequestResponse> requestAcceptReject(id, status) async {
    Map<String, dynamic> body = {"id": id, "status": status};
    Map<String, dynamic> response =
        await putRequest('team/update-request-received', body);

    return AcceptRejectRequestResponse.fromJson(response);
  }
}
