// To parse this JSON data, do
//
//     final registerResponse = registerResponseFromJson(jsonString);

import 'dart:convert';

List<RegisterResponse> registerResponseFromJson(String str) =>
    List<RegisterResponse>.from(
        json.decode(str).map((x) => RegisterResponse.fromJson(x)));

String registerResponseToJson(List<RegisterResponse> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class RegisterResponse {
  RegisterResponse({
    required this.success,
    required this.message,
    this.data,
    this.accessToken,
  });

  bool success;
  String message;
  Data? data;
  String? accessToken;

  factory RegisterResponse.fromJson(Map<String, dynamic> json) =>
      RegisterResponse(
        success: json["success"],
        message: json["message"],
        data: json["data"] == null ? null : Data.fromJson(json["data"]),
        accessToken: json["access_token"] == null ? null : json["access_token"],
      );

  Map<String, dynamic> toJson() => {
        "success": success,
        "message": message,
        "data": data == null ? null : data!.toJson(),
        "access_token": accessToken == null ? null : accessToken,
      };
}

class Data {
  Data({
    this.firstName,
    this.lastName,
    this.email,
    this.phone,
    this.address,
    this.type,
    this.otp,
    this.updatedAt,
    this.createdAt,
    this.id,
    this.inviteCode
  });

  String? firstName;
  String? lastName;
  String? email;
  String? phone;
  String? address;
  String? type;
  int? otp;
  DateTime? updatedAt;
  DateTime? createdAt;
  int? id;
  String? inviteCode;

  factory Data.fromJson(Map<String, dynamic> json) => Data(
        firstName: json["first_name"],
        lastName: json["last_name"],
        email: json["email"],
        phone: json["phone"],
        address: json["address"] == null ? null : json["address"],
        type: json["type"],
        otp: json["otp"] == null ? null : json["otp"],
        updatedAt: DateTime.parse(json["updated_at"]),
        createdAt: DateTime.parse(json["created_at"]),
        id: json["id"],
        inviteCode: json["invite_code"],
      );

  Map<String, dynamic> toJson() => {
        "first_name": firstName,
        "last_name": lastName,
        "email": email,
        "phone": phone,
        "address": address == null ? null : address,
        "type": type,
        "otp": otp == null ? null : otp,
        "updated_at": updatedAt!.toIso8601String(),
        "created_at": createdAt!.toIso8601String(),
        "id": id,
        "invite_code": inviteCode,
      };
}
