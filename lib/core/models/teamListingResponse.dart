// To parse this JSON data, do
//
//     final teamListResponse = teamListResponseFromJson(jsonString);

import 'dart:convert';

TeamListResponse teamListResponseFromJson(String str) =>
    TeamListResponse.fromJson(json.decode(str));

String teamListResponseToJson(TeamListResponse data) =>
    json.encode(data.toJson());

class TeamListResponse {
  TeamListResponse({
    this.status,
    this.message,
    this.data,
  });

  String? status;
  String? message;
  List<TeamData>? data;

  factory TeamListResponse.fromJson(Map<String, dynamic> json) =>
      TeamListResponse(
        status: json["status"],
        message: json["message"],
        data: json["data"] == null
            ? null
            : List<TeamData>.from(
                json["data"].map((x) => TeamData.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "status": status,
        "message": message,
        "data": data == null
            ? null
            : List<dynamic>.from(data!.map((x) => x.toJson())),
      };
}

class TeamData {
  TeamData({
    this.id,
    this.name,
    this.logo,
    this.createdAt,
    this.updatedAt,
  });

  int? id;
  String? name;
  String? logo;
  String? createdAt;
  String? updatedAt;

  factory TeamData.fromJson(Map<String, dynamic> json) => TeamData(
        id: json["id"],
        name: json["name"],
        logo: json["logo"],
        createdAt: json["created_at"],
        updatedAt: json["updated_at"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "logo": logo,
        "created_at": createdAt,
        "updated_at": updatedAt,
      };
}
