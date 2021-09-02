// To parse this JSON data, do
//
//     final ProfileDataResponse = ProfileDataResponseFromJson(jsonString);

import 'dart:convert';

List<ProfileDataResponse> ProfileDataResponseFromJson(String str) =>
    List<ProfileDataResponse>.from(
        json.decode(str).map((x) => ProfileDataResponse.fromJson(x)));

String ProfileDataResponseToJson(List<ProfileDataResponse> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class ProfileDataResponse {
  ProfileDataResponse({
    required this.success,
    required this.message,
    this.data,
  });
  bool success;
  String message;
  ProfileData? data;

  factory ProfileDataResponse.fromJson(Map<String, dynamic> json) =>
      ProfileDataResponse(
        success: json["success"],
        message: json["message"],
        data: json["data"] == null ? null : ProfileData.fromJson(json["data"]),
      );

  Map<String, dynamic> toJson() => {
        "success": success,
        "message": message,
        "data": data == null ? null : data!.toJson(),
      };
}

class ProfileData {
  ProfileData({
    this.user_id,
    this.first_name,
    this.last_name,
    this.email,
    this.phone,
    this.address,
    this.type_of_player,
    this.nick_name,
    this.position,
    this.age,
    this.weight,
    this.height,
    this.nationality,
    this.skill_video,
    this.photo,
    this.teamLogo,
    this.teamId,
  });

  String? user_id;
  String? first_name;
  String? last_name;
  String? email;
  String? phone;
  String? address;
  String? type_of_player;
  String? nick_name;
  String? position;
  String? age;
  String? weight;
  String? height;
  String? nationality;
  List? skill_video;
  List? photo;
  String? teamLogo;
  int? teamId;

  factory ProfileData.fromJson(Map<String, dynamic> json) => ProfileData(
        user_id: json["user_id"],
        first_name: json["first_name"],
        last_name: json["last_name"],
        email: json["email"],
        phone: json["phone"],
        address: json["address"],
        type_of_player: json["type_of_player"],
        nick_name: json["nick_name"],
        position: json["position"],
        age: json["age"],
        weight: json["weight"],
        height: json["height"],
        nationality: json["nationality"],
        skill_video: json["skill_video"],
        photo: json["photo"],
        teamLogo: json["team_logo"],
        teamId: json["team_id"],
      );

  Map<String, dynamic> toJson() => {
        "user_id": user_id,
        "first_name": first_name,
        "last_name": last_name,
        "email": email,
        "address": address,
        "type_of_player": type_of_player,
        "nick_name": nick_name,
        "position": position,
        "age": age,
        "weight": weight,
        "height": height,
        "nationality": nationality,
        "skill_video": skill_video,
        "photo": photo,
        "team_logo": teamLogo,
        "team_id": teamId
      };
}