import 'dart:io';

import 'package:http/http.dart';
import 'package:multi_image_picker2/multi_image_picker2.dart';
import 'package:vamos/core/models/acceptRejectResponse.dart';
import 'package:vamos/core/models/completeStepResponse.dart';
import 'package:vamos/core/models/match/createMatch.dart';
import 'package:vamos/core/models/createTeamResponse.dart';
import 'package:vamos/core/models/deleteMedia.dart';
import 'package:vamos/core/models/genericResponse.dart';
import 'package:vamos/core/models/groundAvailability.dart';
import 'package:vamos/core/models/groundList.dart';
import 'package:vamos/core/models/groundProfileView.dart';
import 'package:vamos/core/models/joinTeam.dart';
import 'package:vamos/core/models/joinedTeamListResponse.dart';
import 'package:vamos/core/models/loginResponse.dart';
import 'package:vamos/core/models/match/matchListResponse.dart';
import 'package:vamos/core/models/match/matchRequest.dart';
import 'package:vamos/core/models/match/matchRequestRecvdByTeam.dart';
import 'package:vamos/core/models/match/teamRequestSentByMatch.dart';
import 'package:vamos/core/models/match/updateMatchRequest.dart';
import 'package:vamos/core/models/myTeamInfo.dart';
import 'package:vamos/core/models/playerListResponse.dart';
import 'package:vamos/core/models/playerRequestResponse.dart';
import 'package:vamos/core/models/profileDataResponse.dart';
import 'package:vamos/core/models/profile_api.dart';
import 'package:vamos/core/models/referalEarning.dart';
import 'package:vamos/core/models/registerResponse.dart';
import 'package:vamos/core/models/teamListingResponse.dart';
import 'package:vamos/core/models/teamRequestReceviedAsPlayerResponse.dart';
import 'package:vamos/core/models/updateGround.dart';
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
    String address,
    String referralCode,
  ) async {
    Map<String, dynamic> body = {
      "phone": mobileNo,
      "first_name": firstName,
      "last_name": lastName,
      "email": email,
      "type": type,
      "password": password,
      "referrer_code": referralCode,
      "address": address
    };
    Map<String, dynamic> response = await postRequest("register", body);
    return RegisterResponse.fromJson(response);
  }

  Future<GroundProfileViewResponse> getGroundProfile(String? groundID) async {
    Map<String, dynamic> response =
        await getRequest('ground?id=' + groundID.toString());
    return GroundProfileViewResponse.fromJson(response);
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
  ) async {
    Map<String, dynamic> body = {
      "name": name,
      "ground_name": groundName,
      "ground_location": groundLocation,
      "booking_fee": bookingFees,
      "booking_date": bookingDate,
      "ground_id": groundId,
      "booking_slot_time": bookingSlotTime,
      "booking_time_slots": bookingTimeslots
    };
    Map<String, dynamic> response = await postRequest("match/store", body);
    return CreateMatch.fromJson(response);
  }

  Future<TeamListResponse> getteamlist() async {
    Map<String, dynamic> response = await getRequest('team');
    return TeamListResponse.fromJson(response);
  }

  Future<GroundList> getGroundlist() async {
    Map<String, dynamic> response = await getRequest('ground-list?offset=0');
    return GroundList.fromJson(response);
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

  Future<RequestMatch> requestMatch(String teamId, int matchId) async {
    Map<String, dynamic> body = {
      "team_id": teamId,
      "match_id": matchId,
    };
    Map<String, dynamic> response =
        await postRequest('team/match-request', body);
    return RequestMatch.fromJson(response);
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

  Future<UpdateGround> updateGround(
      userId, name, location, fees, availableSlots) async {
    Map<String, dynamic> response = await postGroundData(
        "ground/update", userId, name, location, fees, availableSlots);
    return UpdateGround.fromJson(response);
  }

  @override
  Future<CompletedStepResponse> completedtep(String step) async {
    Map<String, dynamic> body = {"completed_step": step};
    Map<String, dynamic> response = await postRequest("completed-step", body);
    return CompletedStepResponse.fromJson(response);
  }

  Future<JoinTeamResponse> requestPlayer(userId, int? teamId) async {
    Map<String, dynamic> body = {
      "user_id": userId,
      "team_id": teamId,
    };
    Map<String, dynamic> response = await postRequest('player/request', body);
    return JoinTeamResponse.fromJson(response);
  }

  @override
  Future<PlayerRequestResponse> getPlayerRequestListByTeam(int? teamId) async {
    Map<String, dynamic> response =
        await getRequest('player/request-received?team_id=$teamId');
    return PlayerRequestResponse.fromJson(response);
  }

  @override
  Future<PlayerRequestResponse> getPlayerJoinedListByTeam(int? teamId) async {
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

  Future<GroundAvailability> groundAvailable(int id, String date) async {
    Map<String, dynamic> response =
        await getRequest('ground-availability?id=$id&date=$date');
    return GroundAvailability.fromJson(response);
  }

  Future<AcceptRejectRequestResponse> requestAcceptReject(id, status) async {
    Map<String, dynamic> body = {"id": id, "status": status};
    Map<String, dynamic> response =
        await putRequest('team/update-request-received', body);

    return AcceptRejectRequestResponse.fromJson(response);
  }

  Future<MyTeamInfo> myTeamInfo() async {
    Map<String, dynamic> response = await getRequest('my-team-info');
    return MyTeamInfo.fromJson(response);
  }

  @override
  Future<JoinedTeamListResponse> getJoinedTeams() async {
    Map<String, dynamic> response = await getRequest('team/joined');
    return JoinedTeamListResponse.fromJson(response);
  }

  Future<GenericResponse> cancelPlayerRequest(teamId, userId) async {
    Map<String, dynamic> body = {"team_id": teamId, "user_id": userId};
    Map<String, dynamic> response =
        await postRequest('player/cancel-request', body);
    return GenericResponse.fromJson(response);
  }

  @override
  Future<ReferalEarning> getEarning() async {
    Map<String, dynamic> response = await getRequest('get-referral-earning');
    return ReferalEarning.fromJson(response);
  }

  @override
  Future<MatchListResponse> getMatchList() async {
    Map<String, dynamic> response = await getRequest('match');
    return MatchListResponse.fromJson(response);
  }

  @override
  Future<MatchRequestReceivedByTeamResponse> getIncomingMatchRequests(
      int teamId) async {
    Map<String, dynamic> response =
        await getRequest('team/match-request-received?team_id=$teamId');
    return MatchRequestReceivedByTeamResponse.fromJson(response);
  }

  @override
  Future<TeamRequestSentByMatch> getTeamRequestsSentByMatch(
      int? matchId) async {
    Map<String, dynamic> response =
        await getRequest('match/team-request?match_id=$matchId');
    return TeamRequestSentByMatch.fromJson(response);
  }

  @override
  Future<UpdateMatchRequestsByTeam> updateMatchRequestsByTeam(
      int? id, String? matchId, String? status) async {
    Map<String, dynamic> body = {
      "id": id,
      "match_id": matchId,
      "status": status
    };

    Map<String, dynamic> response =
        await putRequest('team/update-match-request-received', body);

    return UpdateMatchRequestsByTeam.fromJson(response);
  }

  @override
  Future<GenericResponse> premiumPlayerRequest() async {
    Map<String, dynamic> body = {};

    Map<String, dynamic> response =
        await postRequest('apply-for-premium-player', body);
    return GenericResponse.fromJson(response);
  }

  Future<PlayerListResponse> searchPlayerlist(int isPremium) async {
    Map<String, dynamic> response =
        await getRequest('players?is_premium=$isPremium');
    return PlayerListResponse.fromJson(response);
  }

  Future<MyTeamInfo> teamInfo(teamId) async {
    Map<String, dynamic> response = await getRequest('team-info?id=$teamId');
    return MyTeamInfo.fromJson(response);
  }

  Future<PlayerListResponse> searchPlayerWithFilter(value, filters) async {
    Map<String, dynamic> response =
        await getRequest('players?offset=0&search=$value&search_in[]=$filters');
    return PlayerListResponse.fromJson(response);
  }
}
