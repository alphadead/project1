import 'dart:convert';

CreateTeamResponse CreateTeamResponseFromJson(String str) =>
    CreateTeamResponse.fromJson(json.decode(str));

String CreateTeamResponseToJson(CreateTeamResponse data) =>
    json.encode(data.toJson());

class CreateTeamResponse {
  CreateTeamResponse({
    required this.success,
    this.message,
    this.data,
  });

  bool success;
  String? message;
  Data? data;

  factory CreateTeamResponse.fromJson(Map<String, dynamic> json) =>
      CreateTeamResponse(
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
  Data({this.userId, this.name, this.logo, this.createdAt, this.updatedAt, this.teamId});

  String? userId;
  String? name;
  int? teamId;
  String? createdAt;
  String? updatedAt;
  dynamic logo;

  factory Data.fromJson(Map<String, dynamic> json) => Data(
        userId: json["user_id"],
        name: json["name"],
        logo: json["logo"],
        createdAt: json["created_at"],
        updatedAt: json["updated_at"],
        teamId: json["id"]
      );

  Map<String, dynamic> toJson() => {
        "user_id": userId,
        "name": name,
        "logo": logo,
        "created_at": createdAt,
        "updated_at": updatedAt,
      };
}
