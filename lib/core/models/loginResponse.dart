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
  });

  Data? data;
  String? message;
  Errors? errors;
  String? status;
  String? accessToken;

  factory LoginResponse.fromJson(Map<String, dynamic> json) => LoginResponse(
        data: json["data"] == null ? null : Data.fromJson(json["data"]),
        message: json["message"],
        errors: json["errors"] == null ? null : Errors.fromJson(json["errors"]),
        status: json["status"] == null ? null : json["status"],
        accessToken: json["access_token"] == null ? null : json["access_token"],
      );

  Map<String, dynamic> toJson() => {
        "data": data == null ? null : data!.toJson(),
        "message": message,
        "errors": errors == null ? null : errors!.toJson(),
        "status": status == null ? null : status,
        "access_token": accessToken == null ? null : accessToken,
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
    this.street1,
    this.street2,
    this.city,
    this.state,
    this.pincode,
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
  String? street1;
  String? street2;
  String? city;
  String? state;
  String? pincode;
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
        "updated_at": updatedAt!.toIso8601String(),
        "deleted_at": deletedAt,
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
