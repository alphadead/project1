// To parse this JSON data, do
//
//     final welcome = welcomeFromJson(jsonString);

import 'dart:convert';

PlayerPositionModel welcomeFromJson(String str) =>
    PlayerPositionModel.fromJson(json.decode(str));

String welcomeToJson(PlayerPositionModel data) => json.encode(data.toJson());

class PlayerPositionModel {
  PlayerPositionModel({
    this.success,
    this.message,
    this.data,
  });

  bool? success;
  String? message;
  List<String>? data;

  factory PlayerPositionModel.fromJson(Map<String, dynamic> json) =>
      PlayerPositionModel(
        success: json["success"],
        message: json["message"],
        data: List<String>.from(json["data"].map((x) => x)),
      );

  Map<String, dynamic> toJson() => {
        "success": success,
        "message": message,
        "data": List<dynamic>.from(data!.map((x) => x)),
      };
}
