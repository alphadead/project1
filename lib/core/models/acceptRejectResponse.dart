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
    this.status,
    this.message,
    this.data,
  });

  String? status;
  String? message;
  dynamic data;

  factory AcceptRejectRequestResponse.fromJson(Map<String, dynamic> json) =>
      AcceptRejectRequestResponse(
        status: json["status"] == null ? null : json["status"],
        message: json["message"] == null ? null : json["message"],
        data: json["data"],
      );

  Map<String, dynamic> toJson() => {
        "status": status == null ? null : status,
        "message": message == null ? null : message,
        "data": data,
      };
}
