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
  });

  bool success;
  String message;
  Data? data;

  factory RegisterResponse.fromJson(Map<String, dynamic> json) =>
      RegisterResponse(
        success: json["success"],
        message: json["message"],
        data: json["data"] == null ? null : Data.fromJson(json["data"]),
      );

  Map<String, dynamic> toJson() => {
        "success": success,
        "message": message,
        "data": data == null ? null : data!.toJson(),
      };
}

class Data {
  Data({
    this.firstName,
    this.lastName,
    this.email,
    this.phone,
    this.type,
    this.updatedAt,
    this.createdAt,
    this.id,
  });

  String? firstName;
  String? lastName;
  String? email;
  String? phone;
  String? type;
  DateTime? updatedAt;
  DateTime? createdAt;
  int? id;

  factory Data.fromJson(Map<String, dynamic> json) => Data(
        firstName: json["first_name"],
        lastName: json["last_name"],
        email: json["email"],
        phone: json["phone"],
        type: json["type"],
        updatedAt: DateTime.parse(json["updated_at"]),
        createdAt: DateTime.parse(json["created_at"]),
        id: json["id"],
      );

  Map<String, dynamic> toJson() => {
        "first_name": firstName,
        "last_name": lastName,
        "email": email,
        "phone": phone,
        "type": type,
        "updated_at": updatedAt!.toIso8601String(),
        "created_at": createdAt!.toIso8601String(),
        "id": id,
      };
}