import 'dart:convert';

List<LoginResponse> loginResponseFromJson(String str) =>
    List<LoginResponse>.from(
        json.decode(str).map((x) => LoginResponse.fromJson(x)));

String loginResponseToJson(List<LoginResponse> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class LoginResponse {
  LoginResponse({
    this.data,
    this.message,
    this.errors,
    this.status,
    this.accessToken,
    this.completedStep,
  });

  Data? data;
  String? message;
  Errors? errors;
  String? status;
  String? accessToken;
  int? completedStep;

  factory LoginResponse.fromJson(Map<String, dynamic> json) => LoginResponse(
        data: json["data"] == null ? null : Data.fromJson(json["data"]),
        message: json["message"],
        errors: json["errors"] == null ? null : Errors.fromJson(json["errors"]),
        status: json["status"] == null ? null : json["status"],
        accessToken: json["access_token"] == null ? null : json["access_token"],
        completedStep:
            json["completed_step"] == null ? null : json["completed_step"],
      );

  Map<String, dynamic> toJson() => {
        "data": data == null ? null : data!.toJson(),
        "message": message,
        "errors": errors == null ? null : errors!.toJson(),
        "status": status == null ? null : status,
        "access_token": accessToken == null ? null : accessToken,
        "completed_step": completedStep == null ? null : completedStep,
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
    this.inviteCode,
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
  String? isVerified;
  dynamic createdAt;
  DateTime? updatedAt;
  dynamic deletedAt;
  String? inviteCode;

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
        inviteCode: json["invite_code"],
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
        "invite_code": inviteCode,
      };
}

class Errors {
  Errors({
    this.password,
  });

  List<String>? password;

  factory Errors.fromJson(Map<String, dynamic> json) => Errors(
        password: List<String>.from(json["password"].map((x) => x)),
      );

  Map<String, dynamic> toJson() => {
        "password": List<dynamic>.from(password!.map((x) => x)),
      };
}
