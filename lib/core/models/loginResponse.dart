// To parse this JSON data, do
//
//     final loginResponse = loginResponseFromJson(jsonString);

import 'dart:convert';

LoginResponse loginResponseFromJson(String str) =>
    LoginResponse.fromJson(json.decode(str));

String loginResponseToJson(LoginResponse data) => json.encode(data.toJson());

class LoginResponse {
  LoginResponse({
    required this.status,
    required this.message,
    required this.data,
    required this.accessToken,
  });

  String status;
  String message;
  Data data;
  String accessToken;

  factory LoginResponse.fromJson(Map<String, dynamic> json) => LoginResponse(
        status: json["status"],
        message: json["message"],
        data: Data.fromJson(json["data"]),
        accessToken: json["access_token"],
      );

  Map<String, dynamic> toJson() => {
        "status": status,
        "message": message,
        "data": data.toJson(),
        "access_token": accessToken,
      };
}

class Data {
  Data({
    required this.id,
    required this.type,
    required this.firstName,
    this.lastName,
    required this.email,
    this.emailVerifiedAt,
    required this.phone,
    required this.deviceId,
    required this.deviceToken,
    required this.street1,
    required this.street2,
    required this.city,
    required this.state,
    required this.pincode,
    this.createdAt,
    required this.updatedAt,
    this.deletedAt,
  });

  int id;
  String type;
  String firstName;
  dynamic lastName;
  String email;
  dynamic emailVerifiedAt;
  String phone;
  String deviceId;
  String deviceToken;
  String street1;
  String street2;
  String city;
  String state;
  String pincode;
  dynamic createdAt;
  DateTime updatedAt;
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
        street1: json["street_1"],
        street2: json["street_2"],
        city: json["city"],
        state: json["state"],
        pincode: json["pincode"],
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
        "street_1": street1,
        "street_2": street2,
        "city": city,
        "state": state,
        "pincode": pincode,
        "created_at": createdAt,
        "updated_at": updatedAt.toIso8601String(),
        "deleted_at": deletedAt,
      };
}

class Errors {
  Errors({
    required this.password,
  });

  List<String> password;

  factory Errors.fromJson(Map<String, dynamic> json) => Errors(
        password: List<String>.from(json["password"].map((x) => x)),
      );

  Map<String, dynamic> toJson() => {
        "password": List<dynamic>.from(password.map((x) => x)),
      };
}
