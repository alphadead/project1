// To parse this JSON data, do
//
//     final acceptRejectRequestResponse = acceptRejectRequestResponseFromJson(jsonString);

import 'dart:convert';

AcceptRejectRequestResponse acceptRejectRequestResponseFromJson(String str) =>
    AcceptRejectRequestResponse.fromJson(json.decode(str));

String acceptRejectRequestResponseToJson(AcceptRejectRequestResponse data) =>
    json.encode(data.toJson());

class AcceptRejectRequestResponse {
  AcceptRejectRequestResponse({
    this.success,
    this.message,
    this.data,
  });

  bool? success;
  String? message;
  dynamic data;

  factory AcceptRejectRequestResponse.fromJson(Map<String, dynamic> json) =>
      AcceptRejectRequestResponse(
        success: json["success"] == null ? null : json["success"],
        message: json["message"] == null ? null : json["message"],
        data: json["data"],
      );

  Map<String, dynamic> toJson() => {
        "success": success == null ? null : success,
        "message": message == null ? null : message,
        "data": data,
      };
}
