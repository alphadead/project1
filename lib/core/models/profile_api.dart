import 'dart:convert';

Profile profileFromJson(String str) => Profile.fromJson(json.decode(str));

String profileToJson(Profile data) => json.encode(data.toJson());

class Profile {
  Profile({
    this.success,
    this.message,
    this.data,
  });

  bool? success;
  String? message;
  Data? data;

  factory Profile.fromJson(Map<String, dynamic> json) => Profile(
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
    this.id,
    this.userId,
    this.typeOfPlayer,
    this.position,
    this.age,
    this.weight,
    this.height,
    this.nationality,
    this.skillVideos,
    this.createdAt,
    this.updatedAt,
    this.deletedAt,
    this.photo,
    this.media,
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
  DateTime? createdAt;
  DateTime? updatedAt;
  dynamic deletedAt;
  dynamic photo;
  List<dynamic>? media;

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
        createdAt: DateTime.parse(json["created_at"]),
        updatedAt: DateTime.parse(json["updated_at"]),
        deletedAt: json["deleted_at"],
        photo: json["photo"],
        media: List<dynamic>.from(json["media"].map((x) => x)),
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
        "created_at": createdAt!.toIso8601String(),
        "updated_at": updatedAt!.toIso8601String(),
        "deleted_at": deletedAt,
        "photo": photo,
        "media": List<dynamic>.from(media!.map((x) => x)),
      };
}
