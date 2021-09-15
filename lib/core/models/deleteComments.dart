// To parse this JSON data, do
//
//     final welcome = welcomeFromJson(jsonString);

import 'dart:convert';

DeleteComment welcomeFromJson(String str) =>
    DeleteComment.fromJson(json.decode(str));

String welcomeToJson(DeleteComment data) => json.encode(data.toJson());

class DeleteComment {
  DeleteComment({
    this.success,
    this.message,
    this.data,
  });

  bool? success;
  String? message;
  dynamic data;

  factory DeleteComment.fromJson(Map<String, dynamic> json) => DeleteComment(
        success: json["success"],
        message: json["message"],
        data: json["data"],
      );

  Map<String, dynamic> toJson() => {
        "success": success,
        "message": message,
        "data": data,
      };
}
