// To parse this JSON data, do
//
//     final JoinTeamResponse = JoinTeamFromJson(jsonString);

import 'dart:convert';

JoinTeamResponse joinTeamFromJson(String str) =>
    JoinTeamResponse.fromJson(json.decode(str));

String joinTeamToJson(JoinTeamResponse data) => json.encode(data.toJson());

class JoinTeamResponse {
  JoinTeamResponse({
    required this.success,
    this.message,
    this.data,
  });

  bool success;
  String? message;
  Data? data;

  factory JoinTeamResponse.fromJson(Map<String, dynamic> json) =>
      JoinTeamResponse(
        success: json["success"],
        message: json["message"],
        data: json["data"] == null ? null : Data.fromJson(json["data"]),
      );

  Map<String, dynamic> toJson() => {
        "success": success,
        "message": message,
        "data": data!.toJson(),
      };
}

class Data {
  Data({
    this.userId,
    this.teamId,
    this.status,
    this.requestById,
    this.requestBy,
    this.updatedAt,
    this.createdAt,
    this.id,
  });

  String? userId;
  int? teamId;
  String? status;
  int? requestById;
  String? requestBy;
  String? updatedAt;
  String? createdAt;
  int? id;

  factory Data.fromJson(Map<String, dynamic> json) => Data(
        userId: json["user_id"],
        teamId: json["team_id"],
        status: json["status"],
        requestById: json["request_by_id"],
        requestBy: json["request_by"],
        updatedAt: json["updated_at"],
        createdAt: json["created_at"],
        id: json["id"],
      );

  Map<String, dynamic> toJson() => {
        "user_id": userId,
        "team_id": teamId,
        "status": status,
        "request_by_id": requestById,
        "request_by": requestBy,
        "updated_at": updatedAt,
        "created_at": createdAt,
        "id": id,
      };
}
