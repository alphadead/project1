// To parse this JSON data, do
//
//     final welcome = welcomeFromJson(jsonString);

import 'dart:convert';

TeamSizeModel welcomeFromJson(String str) =>
    TeamSizeModel.fromJson(json.decode(str));

String welcomeToJson(TeamSizeModel data) => json.encode(data.toJson());

class TeamSizeModel {
  TeamSizeModel({
    this.success,
    this.message,
    this.data,
  });

  bool? success;
  String? message;
  Map<String, String>? data;

  factory TeamSizeModel.fromJson(Map<String, dynamic> json) => TeamSizeModel(
        success: json["success"],
        message: json["message"],
        data: Map.from(json["data"])
            .map((k, v) => MapEntry<String, String>(k, v)),
      );

  Map<String, dynamic> toJson() => {
        "success": success,
        "message": message,
        "data": Map.from(data!).map((k, v) => MapEntry<String, dynamic>(k, v)),
      };
}
