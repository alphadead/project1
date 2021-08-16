// To parse this JSON data, do
//
//     final welcome = welcomeFromJson(jsonString);

import 'dart:convert';

DeleteMedia deleteFromJson(String str) =>
    DeleteMedia.fromJson(json.decode(str));

String deleteToJson(DeleteMedia data) => json.encode(data.toJson());

class DeleteMedia {
  DeleteMedia({
    required this.success,
    required this.message,
    this.data,
  });

  bool success;
  String message;
  dynamic data;

  factory DeleteMedia.fromJson(Map<String, dynamic> json) => DeleteMedia(
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
