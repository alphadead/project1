import 'dart:convert';

ProfileResponse profileResponseFromJson(String str) =>
    ProfileResponse.fromJson(json.decode(str));

String profileResponseToJson(ProfileResponse data) =>
    json.encode(data.toJson());

class ProfileResponse {
  ProfileResponse({
    required this.success,
    this.message,
    this.data,
  });

  bool success;
  String? message;
  Data? data;

  factory ProfileResponse.fromJson(Map<String, dynamic> json) =>
      ProfileResponse(
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
    this.id,
    this.userId,
    this.typeOfPlayer,
    this.position,
    this.age,
    this.weight,
    this.height,
    this.nationality,
    this.skillVideos,
    this.photo,
  });

  int? id;
  String? userId;
  String? typeOfPlayer;
  String? position;
  String? age;
  String? weight;
  String? height;
  String? nationality;
  dynamic skillVideos;

  dynamic photo;

  factory Data.fromJson(Map<String, dynamic> json) => Data(
        id: json["id"],
        userId: json["user_id"],
        typeOfPlayer: json["type_of_player"],
        position: json["position"],
        age: json["age"],
        weight: json["weight"],
        height: json["height"],
        nationality: json["nationality"],
        skillVideos: json["skill_videos"],
        photo: json["photo"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "user_id": userId,
        "type_of_player": typeOfPlayer,
        "position": position,
        "age": age,
        "weight": weight,
        "height": height,
        "nationality": nationality,
        "skill_videos": skillVideos,
        "photo": photo,
      };
}
