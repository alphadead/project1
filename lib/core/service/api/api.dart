import 'dart:io';

import 'package:multi_image_picker2/multi_image_picker2.dart';
import 'package:vamos/core/models/acceptRejectResponse.dart';
import 'package:vamos/core/models/completeStepResponse.dart';
import 'package:vamos/core/models/createTeamResponse.dart';
import 'package:vamos/core/models/deleteMedia.dart';
import 'package:vamos/core/models/genericResponse.dart';
import 'package:vamos/core/models/joinTeam.dart';
import 'package:vamos/core/models/joinedTeamListResponse.dart';
import 'package:vamos/core/models/loginResponse.dart';
import 'package:vamos/core/models/myTeamInfo.dart';
import 'package:vamos/core/models/playerListResponse.dart';
import 'package:vamos/core/models/playerRequestResponse.dart';
import 'package:vamos/core/models/profileDataResponse.dart';
import 'package:vamos/core/models/profile_api.dart';
import 'package:vamos/core/models/referalEarning.dart';
import 'package:vamos/core/models/registerResponse.dart';
import 'package:vamos/core/models/teamListingResponse.dart';
import 'package:vamos/core/models/teamRequestReceviedAsPlayerResponse.dart';
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
    String address,
    String referralCode,
  );

  Future<CreateTeamResponse> createTeam(
      String name, Asset logo, String teamSize);

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
      List<File> files);

  Future<TeamListResponse> getteamlist();
  Future<PlayerRequestResponse> getPlayerRequestListByTeam(int? teamId);
  Future<PlayerRequestResponse> getPlayerJoinedListByTeam(int? teamId);
  Future<ProfileDataResponse> getProfile(String userId);
  Future<JoinTeamResponse> joinTeam(
    int teamId,
  );
  Future<VerifyOtpResponse> verifyOtp(userId, mobileNo, otp);
  Future<PlayerListResponse> getPlayerlist();
  Future<ReferalEarning> getEarning();
  Future<CompletedStepResponse> completedtep(String step);
  Future<JoinTeamResponse> requestPlayer(
    userId,
    int? teamId,
  );
  Future<DeleteMedia> deleteMedias(String mediaId);
  Future<GenericResponse> cancelTeamRequest(teamId);
  Future<TeamRequestReceivedAsPlayerResponse> requestRecived();
  Future<AcceptRejectRequestResponse> requestAcceptReject(id, status);
  Future<MyTeamInfo> myTeamInfo();
  Future<JoinedTeamListResponse> getJoinedTeams();
  Future<GenericResponse> cancelPlayerRequest(teamId, userId);
}
