// To parse this JSON data, do
//
//     final welcome = welcomeFromJson(jsonString);

import 'dart:convert';

CommentListModel welcomeFromJson(String str) =>
    CommentListModel.fromJson(json.decode(str));

String welcomeToJson(CommentListModel data) => json.encode(data.toJson());

class CommentListModel {
  CommentListModel({
    this.success,
    this.message,
    this.data,
  });

  bool? success;
  String? message;
  List<CommentModel>? data;

  factory CommentListModel.fromJson(Map<String, dynamic> json) =>
      CommentListModel(
        success: json["success"],
        message: json["message"],
        data: List<CommentModel>.from(
            json["data"].map((x) => CommentModel.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "success": success,
        "message": message,
        "data": List<dynamic>.from(data!.map((x) => x.toJson())),
      };
}

class CommentModel {
  CommentModel({
    this.id,
    this.playerId,
    this.comment,
    this.rating,
    this.createdById,
    this.createdAt,
    this.updatedAt,
    this.deletedAt,
  });

  int? id;
  String? playerId;
  String? comment;
  String? rating;
  String? createdById;
  String? createdAt;
  String? updatedAt;
  dynamic deletedAt;

  factory CommentModel.fromJson(Map<String, dynamic> json) => CommentModel(
        id: json["id"],
        playerId: json["player_id"],
        comment: json["comment"],
        rating: json["rating"],
        createdById: json["created_by_id"],
        createdAt: json["created_at"],
        updatedAt: json["updated_at"],
        deletedAt: json["deleted_at"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "player_id": playerId,
        "comment": comment,
        "rating": rating,
        "created_by_id": createdById,
        "created_at": createdAt,
        "updated_at": updatedAt,
        "deleted_at": deletedAt,
      };
}
