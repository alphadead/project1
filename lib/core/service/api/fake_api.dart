import 'dart:io';

import 'package:multi_image_picker2/multi_image_picker2.dart';
import 'package:vamos/core/models/acceptRejectResponse.dart';
import 'package:vamos/core/models/addComment.dart';
import 'package:vamos/core/models/commentsList.dart';
import 'package:vamos/core/models/completeStepResponse.dart';
import 'package:vamos/core/models/deleteComments.dart';
import 'package:vamos/core/models/match/createMatch.dart';
import 'package:vamos/core/models/createTeamResponse.dart';
import 'package:vamos/core/models/deleteMedia.dart';
import 'package:vamos/core/models/genericResponse.dart';
import 'package:vamos/core/models/ground/groundAvailability.dart';
import 'package:vamos/core/models/ground/groundList.dart';
import 'package:vamos/core/models/ground/groundProfileView.dart';
import 'package:vamos/core/models/team/joinTeam.dart';
import 'package:vamos/core/models/team/joinedTeamListResponse.dart';
import 'package:vamos/core/models/loginResponse.dart';
import 'package:vamos/core/models/match/matchListResponse.dart';
import 'package:vamos/core/models/match/matchRequest.dart';
import 'package:vamos/core/models/match/matchRequestRecvdByTeam.dart';
import 'package:vamos/core/models/match/teamRequestSentByMatch.dart';
import 'package:vamos/core/models/match/updateMatchRequest.dart';
import 'package:vamos/core/models/team/myTeamInfo.dart';
import 'package:vamos/core/models/playerListResponse.dart';
import 'package:vamos/core/models/playerPosition.dart';
import 'package:vamos/core/models/playerRequestResponse.dart';
import 'package:vamos/core/models/profileDataResponse.dart';
import 'package:vamos/core/models/profile_api.dart';
import 'package:vamos/core/models/referalEarning.dart';
import 'package:vamos/core/models/registerResponse.dart';
import 'package:vamos/core/models/setup/playerPositionsResponse.dart';
import 'package:vamos/core/models/setup/teamSizesResponse.dart';
import 'package:vamos/core/models/team/teamListingResponse.dart';
import 'package:vamos/core/models/team/teamRequestReceviedAsPlayerResponse.dart';
import 'package:vamos/core/models/team/teamSize.dart';
import 'package:vamos/core/models/match/upcomingMatches.dart';
import 'package:vamos/core/models/ground/updateGround.dart';
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
    String address,
    String referralCode,
  ) {
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

  Future<CreateMatch> createMatch(
    String userId,
    String? name,
    int? groundId,
    String? groundName,
    String? groundLocation,
    String? bookingFees,
    String? bookingDate,
    bookingTimeslots,
    bookingSlotTime,
    String? teamSize,
  ) {
    throw UnimplementedError();
  }

  Future<TeamListResponse> getteamlist() {
    throw UnimplementedError();
  }

  Future<GroundList> getGroundlist() {
    throw UnimplementedError();
  }

  Future<TeamSizeModel> teamSize() {
    throw UnimplementedError();
  }

  Future<PlayerPositionModel> position() {
    throw UnimplementedError();
  }

  Future<JoinTeamResponse> joinTeam(
    int teamId,
  ) {
    throw UnimplementedError();
  }

  Future<RequestMatch> requestMatch(String teamId, int matchId) {
    throw UnimplementedError();
  }

  Future<GroundAvailability> groundAvailable(int id, String date) {
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

  @override
  Future<ReferalEarning> getEarning() async {
    throw UnimplementedError();
  }

  @override
  Future<MatchListResponse> getMatchList() {
    // TODO: implement getMatchList
    throw UnimplementedError();
  }

  @override
  Future<MatchRequestReceivedByTeamResponse> getIncomingMatchRequests(
      int teamId) {
    // TODO: implement getIncomingMatchRequests
    throw UnimplementedError();
  }

  @override
  Future<TeamRequestSentByMatch> getTeamRequestsSentByMatch(int? matchId) {
    // TODO: implement getTeamRequestsSentByMatch
    throw UnimplementedError();
  }

  @override
  Future<CommentListModel> commentListModel(String? userId) {
    // TODO: implement commentList
    throw UnimplementedError();
  }

  @override
  Future<AddComment> addComment(
      String? playerId, String? comment, String? rating) {
    // TODO: implement addComment
    throw UnimplementedError();
  }

  @override
  Future<UpcomingMatches> upcomingMatches(String? date) {
    // TODO: implement addComment
    throw UnimplementedError();
  }

  @override
  Future<DeleteComment> deleteComment(int? id) {
    // TODO: deleteComment
    throw UnimplementedError();
  }

  @override
  Future<UpdateMatchRequestsByTeam> updateMatchRequestsByTeam(
      int? id, String? matchId, String? status, List? players) {
    // TODO: implement updateMatchRequestsByTeam
    throw UnimplementedError();
  }

  @override
  Future<GenericResponse> premiumPlayerRequest() {
    // TODO: implement premiumPlayerRequest
    throw UnimplementedError();
  }

  Future<PlayerListResponse> searchPlayerlist(int isPremium) {
    throw UnimplementedError();
  }

  Future<MyTeamInfo> teamInfo(teamId) {
    throw UnimplementedError();
  }

  Future<PlayerListResponse> searchPlayerWithFilter(value, filters) {
    throw UnimplementedError();
  }

  Future<CommentListModel> commentListPageModel(int offset, String userId) {
    throw UnimplementedError();
  }

  @override
  Future<GenericResponse> updateTeamRequestsByMatch(int? id, String? status) {
    // TODO: implement updateTeamRequestsByMatch
    throw UnimplementedError();
  }

  @override
  Future<TeamSizesResponse> getTeamSize() {
    throw UnimplementedError();
  }

  @override
  Future<PlayerPositionsResponse> getPlayerPosition() {
    throw UnimplementedError();
  }

  @override
  Future<GenericResponse> selectMatchPlayers(matchId, teamId, players) {
    // TODO: implement selectMatchPlayers
    throw UnimplementedError();
  }
}
