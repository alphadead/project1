// To parse this JSON data, do
//
//     final welcome = welcomeFromJson(jsonString);

import 'dart:convert';

RequestMatch welcomeFromJson(String str) =>
    RequestMatch.fromJson(json.decode(str));

String welcomeToJson(RequestMatch data) => json.encode(data.toJson());

class RequestMatch {
  RequestMatch({
    this.success,
    this.message,
    this.data,
  });

  bool? success;
  String? message;
  Data? data;

  factory RequestMatch.fromJson(Map<String, dynamic> json) => RequestMatch(
        success: json["success"],
        message: json["message"],
        data: Data.fromJson(json["data"]),
      );

  Map<String, dynamic> toJson() => {
        "success": success,
        "message": message,
        "data": data!.toJson(),
      };
}

class Data {
  Data({
    this.teamId,
    this.matchId,
    this.status,
    this.requestById,
    this.updatedAt,
    this.createdAt,
    this.id,
  });

  String? teamId;
  int? matchId;
  String? status;
  int? requestById;
  String? updatedAt;
  String? createdAt;
  int? id;

  factory Data.fromJson(Map<String, dynamic> json) => Data(
        teamId: json["team_id"],
        matchId: json["match_id"],
        status: json["status"],
        requestById: json["request_by_id"],
        updatedAt: json["updated_at"],
        createdAt: json["created_at"],
        id: json["id"],
      );

  Map<String, dynamic> toJson() => {
        "team_id": teamId,
        "match_id": matchId,
        "status": status,
        "request_by_id": requestById,
        "updated_at": updatedAt,
        "created_at": createdAt,
        "id": id,
      };
}
