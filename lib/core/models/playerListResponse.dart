// To parse this JSON data, do
//
//     final playerListResponse = playerListResponseFromJson(jsonString);

import 'dart:convert';

PlayerListResponse playerListResponseFromJson(String str) =>
    PlayerListResponse.fromJson(json.decode(str));

String playerListResponseToJson(PlayerListResponse data) =>
    json.encode(data.toJson());

class PlayerListResponse {
  PlayerListResponse({
    this.status,
    this.message,
    this.data,
  });

  String? status;
  String? message;
  List<PlayerData>? data;

  factory PlayerListResponse.fromJson(Map<String, dynamic> json) =>
      PlayerListResponse(
        status: json["status"] == null ? null : json["status"],
        message: json["message"] == null ? null : json["message"],
        data: json["data"] == null
            ? null
            : List<PlayerData>.from(
                json["data"].map((x) => PlayerData.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "status": status == null ? null : status,
        "message": message == null ? null : message,
        "data": data == null
            ? null
            : List<dynamic>.from(data!.map((x) => x.toJson())),
      };
}

class PlayerData {
  PlayerData({
    this.id,
    this.firstName,
    this.lastName,
    this.email,
    this.phone,
    this.address,
    this.street2,
    this.city,
    this.state,
    this.pincode,
    this.createdAt,
    this.updatedAt,
    this.isJoined,
  });

  int? id;
  String? firstName;
  String? lastName;
  String? email;
  String? phone;
  String? address;
  dynamic street2;
  dynamic city;
  dynamic state;
  dynamic pincode;
  DateTime? createdAt;
  DateTime? updatedAt;
  bool? isJoined = false;

  factory PlayerData.fromJson(Map<String, dynamic> json) => PlayerData(
      id: json["id"] == null ? null : json["id"],
      firstName: json["first_name"] == null ? null : json["first_name"],
      lastName: json["last_name"] == null ? null : json["last_name"],
      email: json["email"] == null ? null : json["email"],
      phone: json["phone"] == null ? null : json["phone"],
      address: json["address"] == null ? null : json["address"],
      street2: json["street_2"],
      city: json["city"],
      state: json["state"],
      pincode: json["pincode"],
      createdAt: json["created_at"] == null
          ? null
          : DateTime.parse(json["created_at"]),
      updatedAt: json["updated_at"] == null
          ? null
          : DateTime.parse(json["updated_at"]),
      isJoined: json["isJoined"] == null ? false : true);

  Map<String, dynamic> toJson() => {
        "id": id == null ? null : id,
        "first_name": firstName == null ? null : firstName,
        "last_name": lastName == null ? null : lastName,
        "email": email == null ? null : email,
        "phone": phone == null ? null : phone,
        "address": address == null ? null : address,
        "street_2": street2,
        "city": city,
        "state": state,
        "pincode": pincode,
        "created_at": createdAt == null ? null : createdAt!.toIso8601String(),
        "updated_at": updatedAt == null ? null : updatedAt!.toIso8601String(),
      };
}
