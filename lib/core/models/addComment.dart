// To parse this JSON data, do
//
//     final welcome = welcomeFromJson(jsonString);

import 'dart:convert';

AddComment welcomeFromJson(String str) => AddComment.fromJson(json.decode(str));

String welcomeToJson(AddComment data) => json.encode(data.toJson());

class AddComment {
  AddComment({
    this.success,
    this.message,
    this.data,
  });

  bool? success;
  String? message;
  Data? data;

  factory AddComment.fromJson(Map<String, dynamic> json) => AddComment(
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
    this.playerId,
    this.comment,
    this.rating,
    this.createdById,
    this.updatedAt,
    this.createdAt,
    this.id,
  });

  String? playerId;
  String? comment;
  String? rating;
  int? createdById;
  String? updatedAt;
  String? createdAt;
  int? id;

  factory Data.fromJson(Map<String, dynamic> json) => Data(
        playerId: json["player_id"],
        comment: json["comment"],
        rating: json["rating"],
        createdById: json["created_by_id"],
        updatedAt: json["updated_at"],
        createdAt: json["created_at"],
        id: json["id"],
      );

  Map<String, dynamic> toJson() => {
        "player_id": playerId,
        "comment": comment,
        "rating": rating,
        "created_by_id": createdById,
        "updated_at": updatedAt,
        "created_at": createdAt,
        "id": id,
      };
}
