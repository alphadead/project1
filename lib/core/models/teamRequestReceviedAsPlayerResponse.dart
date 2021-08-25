// To parse this JSON data, do
//
//     final teamRequestReceivedAsPlayerResponse = teamRequestReceivedAsPlayerResponseFromJson(jsonString);

import 'dart:convert';

TeamRequestReceivedAsPlayerResponse teamRequestReceivedAsPlayerResponseFromJson(
        String str) =>
    TeamRequestReceivedAsPlayerResponse.fromJson(json.decode(str));

String teamRequestReceivedAsPlayerResponseToJson(
        TeamRequestReceivedAsPlayerResponse data) =>
    json.encode(data.toJson());

class TeamRequestReceivedAsPlayerResponse {
  TeamRequestReceivedAsPlayerResponse({
    this.status,
    this.message,
    this.data,
  });

  String? status;
  String? message;
  List<Datum>? data;

  factory TeamRequestReceivedAsPlayerResponse.fromJson(
          Map<String, dynamic> json) =>
      TeamRequestReceivedAsPlayerResponse(
        status: json["status"] == null ? null : json["status"],
        message: json["message"] == null ? null : json["message"],
        data: json["data"] == null
            ? null
            : List<Datum>.from(json["data"].map((x) => Datum.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "status": status == null ? null : status,
        "message": message == null ? null : message,
        "data": data == null
            ? null
            : List<dynamic>.from(data!.map((x) => x.toJson())),
      };
}

class Datum {
  Datum({
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

  factory Datum.fromJson(Map<String, dynamic> json) => Datum(
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
