// To parse this JSON data, do
//
//     final teamListResponse = teamListResponseFromJson(jsonString);

import 'dart:convert';

JoinedTeamListResponse teamListResponseFromJson(String str) =>
    JoinedTeamListResponse.fromJson(json.decode(str));

String teamListResponseToJson(JoinedTeamListResponse data) =>
    json.encode(data.toJson());

class JoinedTeamListResponse {
  JoinedTeamListResponse({
    this.status,
    this.message,
    this.data,
  });

  String? status;
  String? message;
  List<JoinedTeamData>? data;

  factory JoinedTeamListResponse.fromJson(Map<String, dynamic> json) =>
      JoinedTeamListResponse(
        status: json["status"],
        message: json["message"],
        data: json["data"] == null
            ? null
            : List<JoinedTeamData>.from(
                json["data"].map((x) => JoinedTeamData.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "status": status,
        "message": message,
        "data": data == null
            ? null
            : List<dynamic>.from(data!.map((x) => x.toJson())),
      };
}

class JoinedTeamData {
  JoinedTeamData(
      {this.id,
      this.name,
      this.teamSize,
      this.status,
      this.logo,
      this.createdAt,
      this.updatedAt,
      this.isJoined,
      this.teamId});

  int? id;
  String? teamId;
  String? name;
  String? teamSize;
  String? status;
  String? logo;
  String? createdAt;
  String? updatedAt;
  bool? isJoined = false;

  factory JoinedTeamData.fromJson(Map<String, dynamic> json) => JoinedTeamData(
      id: json["id"],
      teamId: json["team_id"],
      name: json["team_name"],
      teamSize: json["team_size"] == null ? null : json["team_size"],
      status: json["status"] == null ? null : json["status"],
      logo: json["team_logo"],
      createdAt: json["created_at"],
      updatedAt: json["updated_at"],
      isJoined: json["isJoined"] == null ? false : true);

  Map<String, dynamic> toJson() => {
        "id": id,
        "team_id": teamId,
        "team_name": name,
        "team_size": teamSize == null ? null : teamSize,
        "status": status == null ? null : status,
        "team_logo": logo,
        "created_at": createdAt,
        "updated_at": updatedAt,
      };
}
