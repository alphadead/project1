import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:multi_image_picker2/multi_image_picker2.dart';
import 'package:vamos/core/models/acceptRejectResponse.dart';
import 'package:vamos/core/models/completeStepResponse.dart';
import 'package:vamos/core/models/createTeamResponse.dart';
import 'package:vamos/core/models/deleteMedia.dart';
import 'package:vamos/core/models/genericResponse.dart';
import 'package:vamos/core/models/groundProfileView.dart';
import 'package:vamos/core/models/joinTeam.dart';
import 'package:vamos/core/models/joinedTeamListResponse.dart';
import 'package:vamos/core/models/loginResponse.dart';
import 'package:vamos/core/models/myTeamInfo.dart';
import 'package:vamos/core/models/playerListResponse.dart';
import 'package:vamos/core/models/playerRequestResponse.dart';
import 'package:vamos/core/models/profileDataResponse.dart';
import 'package:vamos/core/models/profile_api.dart';
import 'package:vamos/core/models/registerResponse.dart';
import 'package:vamos/core/models/teamListingResponse.dart';
import 'package:vamos/core/models/teamRequestReceviedAsPlayerResponse.dart';
import 'package:vamos/core/models/updateGround.dart';
import 'package:vamos/core/models/verifyOtpResponse.dart';
import 'package:vamos/core/service/api/api.dart';

class FakeApi extends Api {
  Future<LoginResponse> loginUser(String mobileNo, String password) {
    throw UnimplementedError();
  }

  Future<RegisterResponse> registerStep(
      String firstName,
      String lastName,
      String email,
      String mobileNo,
      String type,
      String password,
      String address) {
    throw UnimplementedError();
  }

  Future<GroundProfileViewResponse> getGroundProfile(String? groundID) {
    throw UnimplementedError();
  }

  Future<ProfileDataResponse> getProfile(String userId) {
    throw UnimplementedError();
  }

  Future<CreateTeamResponse> createTeam(
      String name, Asset logo, String teamSize) {
    throw UnimplementedError();
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
      List<File> files) {
    throw UnimplementedError();
  }

  Future<TeamListResponse> getteamlist() {
    throw UnimplementedError();
  }

  Future<JoinTeamResponse> joinTeam(
    int teamId,
  ) {
    throw UnimplementedError();
  }

  Future<DeleteMedia> deleteMedias(String mediaId) {
    throw UnimplementedError();
  }

  Future<VerifyOtpResponse> verifyOtp(userId, mobileNo, otp) {
    throw UnimplementedError();
  }

  Future<PlayerListResponse> getPlayerlist() {
    throw UnimplementedError();
  }

  @override
  Future<CompletedStepResponse> completedtep(String step) {
    throw UnimplementedError();
  }

  Future<JoinTeamResponse> requestPlayer(
    userId,
    int? teamId,
  ) {
    throw UnimplementedError();
  }

  @override
  Future<PlayerRequestResponse> getPlayerRequestListByTeam(int? teamId) {
    throw UnimplementedError();
  }

  @override
  Future<PlayerRequestResponse> getPlayerJoinedListByTeam(int? teamId) {
    throw UnimplementedError();
  }

  Future<GenericResponse> cancelTeamRequest(teamId) {
    throw UnimplementedError();
  }

  Future<TeamRequestReceivedAsPlayerResponse> requestRecived() {
    throw UnimplementedError();
  }

  Future<UpdateGround> updateGround(
      userId, name, location, fees, availableSlots) {
    throw UnimplementedError();
  }

  Future<AcceptRejectRequestResponse> requestAcceptReject(id, status) {
    throw UnimplementedError();
  }

  Future<MyTeamInfo> myTeamInfo() async {
    throw UnimplementedError();
  }

  @override
  Future<JoinedTeamListResponse> getJoinedTeams() {
    // TODO: implement getJoinedTeams
    throw UnimplementedError();
  }

  @override
  Future<GenericResponse> cancelPlayerRequest(teamId, userId) {
    throw UnimplementedError();
  }
}
