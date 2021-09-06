// To parse this JSON data, do
//
//     final matchRequestReceivedasTeamResponse = matchRequestReceivedasTeamResponseFromJson(jsonString);

import 'dart:convert';

MatchRequestReceivedByTeamResponse matchRequestReceivedByTeamResponseFromJson(
        String str) =>
    MatchRequestReceivedByTeamResponse.fromJson(json.decode(str));

String matchRequestReceivedByTeamResponseToJson(
        MatchRequestReceivedByTeamResponse data) =>
    json.encode(data.toJson());

class MatchRequestReceivedByTeamResponse {
  MatchRequestReceivedByTeamResponse({
    this.status,
    this.message,
    this.data,
  });

  String? status;
  String? message;
  List<MatchRequest>? data;

  factory MatchRequestReceivedByTeamResponse.fromJson(
          Map<String, dynamic> json) =>
      MatchRequestReceivedByTeamResponse(
        status: json["status"] == null ? null : json["status"],
        message: json["message"] == null ? null : json["message"],
        data: json["data"] == null
            ? null
            : List<MatchRequest>.from(json["data"].map((x) => MatchRequest.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "status": status == null ? null : status,
        "message": message == null ? null : message,
        "data": data == null
            ? null
            : List<dynamic>.from(data!.map((x) => x.toJson())),
      };
}

class MatchRequest {
  MatchRequest({
    this.id,
    this.matchId,
    this.matchName,
    this.status,
  });

  int? id;
  String? matchId;
  String? matchName;
  String? status;

  factory MatchRequest.fromJson(Map<String, dynamic> json) => MatchRequest(
        id: json["id"] == null ? null : json["id"],
        matchId: json["match_id"] == null ? null : json["match_id"],
        matchName: json["match_name"] == null ? null : json["match_name"],
        status: json["status"] == null ? null : json["status"],
      );

  Map<String, dynamic> toJson() => {
        "id": id == null ? null : id,
        "match_id": matchId == null ? null : matchId,
        "match_name": matchName == null ? null : matchName,
        "status": status == null ? null : status,
      };
}

