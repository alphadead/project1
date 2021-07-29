// To parse this JSON data, do
//
//     final verifyOtpResponse = verifyOtpResponseFromJson(jsonString);

import 'dart:convert';

VerifyOtpResponse verifyOtpResponseFromJson(String str) =>
    VerifyOtpResponse.fromJson(json.decode(str));

String verifyOtpResponseToJson(VerifyOtpResponse data) =>
    json.encode(data.toJson());

class VerifyOtpResponse {
  VerifyOtpResponse({
    this.success,
    this.message,
    this.data,
  });

  bool? success;
  String? message;
  Data? data;

  factory VerifyOtpResponse.fromJson(Map<String, dynamic> json) =>
      VerifyOtpResponse(
        success: json["success"] == null ? null : json["success"],
        message: json["message"] == null ? null : json["message"],
        data: json["data"] == null ? null : Data.fromJson(json["data"]),
      );

  Map<String, dynamic> toJson() => {
        "success": success == null ? null : success,
        "message": message == null ? null : message,
        "data": data == null ? null : data!.toJson(),
      };
}

class Data {
  Data({
    this.id,
    this.type,
    this.firstName,
    this.lastName,
    this.email,
    this.emailVerifiedAt,
    this.phone,
    this.deviceId,
    this.deviceToken,
    this.address,
    this.street2,
    this.city,
    this.state,
    this.pincode,
    this.otp,
    this.isVerified,
    this.createdAt,
    this.updatedAt,
    this.deletedAt,
  });

  int? id;
  String? type;
  String? firstName;
  dynamic lastName;
  String? email;
  dynamic emailVerifiedAt;
  String? phone;
  String? deviceId;
  String? deviceToken;
  String? address;
  String? street2;
  String? city;
  String? state;
  String? pincode;
  String? otp;
  int? isVerified;
  dynamic createdAt;
  DateTime? updatedAt;
  dynamic deletedAt;

  factory Data.fromJson(Map<String, dynamic> json) => Data(
        id: json["id"],
        type: json["type"],
        firstName: json["first_name"],
        lastName: json["last_name"],
        email: json["email"],
        emailVerifiedAt: json["email_verified_at"],
        phone: json["phone"],
        deviceId: json["device_id"],
        deviceToken: json["device_token"],
        address: json["address"] == null ? null : json["address"],
        street2: json["street_2"],
        city: json["city"],
        state: json["state"],
        pincode: json["pincode"],
        otp: json["otp"] == null ? null : json["otp"],
        isVerified: json["is_verified"] == null ? null : json["is_verified"],
        createdAt: json["created_at"],
        updatedAt: DateTime.parse(json["updated_at"]),
        deletedAt: json["deleted_at"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "type": type,
        "first_name": firstName,
        "last_name": lastName,
        "email": email,
        "email_verified_at": emailVerifiedAt,
        "phone": phone,
        "device_id": deviceId,
        "device_token": deviceToken,
        "address": address == null ? null : address,
        "street_2": street2,
        "city": city,
        "state": state,
        "pincode": pincode,
        "otp": otp == null ? null : otp,
        "is_verified": isVerified == null ? null : isVerified,
        "created_at": createdAt,
        "updated_at": updatedAt!.toIso8601String(),
        "deleted_at": deletedAt,
      };
}
