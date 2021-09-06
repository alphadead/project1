// To parse this JSON data, do
//
//     final teamRequestSentByMatch = teamRequestSentByMatchFromJson(jsonString);

import 'dart:convert';

TeamRequestSentByMatch teamRequestSentByMatchFromJson(String str) =>
    TeamRequestSentByMatch.fromJson(json.decode(str));

String teamRequestSentByMatchToJson(TeamRequestSentByMatch data) =>
    json.encode(data.toJson());

class TeamRequestSentByMatch {
  TeamRequestSentByMatch({
    this.status,
    this.message,
    this.data,
  });

  String? status;
  String? message;
  List<Team>? data;

  factory TeamRequestSentByMatch.fromJson(Map<String, dynamic> json) =>
      TeamRequestSentByMatch(
        status: json["status"] == null ? null : json["status"],
        message: json["message"] == null ? null : json["message"],
        data: json["data"] == null
            ? null
            : List<Team>.from(json["data"].map((x) => Team.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "status": status == null ? null : status,
        "message": message == null ? null : message,
        "data": data == null
            ? null
            : List<dynamic>.from(data!.map((x) => x.toJson())),
      };
}

class Team {
  Team({
    this.id,
    this.teamId,
    this.teamName,
    this.teamLogo,
    this.status,
    this.createdAt,
    this.updatedAt,
  });

  int? id;
  String? teamId;
  String? teamName;
  String? teamLogo;
  String? status;
  String? createdAt;
  String? updatedAt;

  factory Team.fromJson(Map<String, dynamic> json) => Team(
        id: json["id"] == null ? null : json["id"],
        teamId: json["team_id"] == null ? null : json["team_id"],
        teamName: json["team_name"] == null ? null : json["team_name"],
        teamLogo: json["team_logo"] == null ? null : json["team_logo"],
        status: json["status"] == null ? null : json["status"],
        createdAt: json["created_at"] == null ? null : json["created_at"],
        updatedAt: json["updated_at"] == null ? null : json["updated_at"],
      );

  Map<String, dynamic> toJson() => {
        "id": id == null ? null : id,
        "team_id": teamId == null ? null : teamId,
        "team_name": teamName == null ? null : teamName,
        "team_logo": teamLogo == null ? null : teamLogo,
        "status": status == null ? null : status,
        "created_at": createdAt == null ? null : createdAt,
        "updated_at": updatedAt == null ? null : updatedAt,
      };
}
