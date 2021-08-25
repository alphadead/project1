// To parse this JSON data, do
//
//     final PlayerRequestResponse = PlayerRequestResponseFromJson(jsonString);

import 'dart:convert';

PlayerRequestResponse playerRequestResponseFromJson(String str) =>
    PlayerRequestResponse.fromJson(json.decode(str));

String playerRequestResponseToJson(PlayerRequestResponse data) =>
    json.encode(data.toJson());

class PlayerRequestResponse {
  PlayerRequestResponse({
    this.status,
    this.message,
    this.data,
  });

  String? status;
  String? message;
  List<PlayerData>? data;

  factory PlayerRequestResponse.fromJson(Map<String, dynamic> json) =>
      PlayerRequestResponse(
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
    this.userID,
    this.firstName,
    this.lastName,
    this.email,
    this.phone,
    this.address,
    this.nickName,
    this.photo,
    this.createdAt,
    this.updatedAt,
  });

  int? id;
  String? userID;
  String? firstName;
  String? lastName;
  String? email;
  String? phone;
  String? address;
  String? nickName;
  String? photo;
  DateTime? createdAt;
  DateTime? updatedAt;

  factory PlayerData.fromJson(Map<String, dynamic> json) => PlayerData(
      id: json["id"] == null ? null : json["id"],
      userID: json["user_id"] == null ? null : json["user_id"],
      firstName: json["user_first_name"] == null ? null : json["first_name"],
      lastName: json["user_last_name"] == null ? null : json["last_name"],
      email: json["user_email"] == null ? null : json["email"],
      phone: json["user_phone"] == null ? null : json["phone"],
      address: json["user_address"] == null ? null : json["address"],
      nickName: json["nick_name"],
      photo: json["user_photo"],
      createdAt: json["created_at"] == null
          ? null
          : DateTime.parse(json["created_at"]),
      updatedAt: json["updated_at"] == null
          ? null
          : DateTime.parse(json["updated_at"]));

  Map<String, dynamic> toJson() => {
        "id": id == null ? null : id,
        "user_id": id == null ? null : id,
        "user_first_name": firstName == null ? null : firstName,
        "user_last_name": lastName == null ? null : lastName,
        "user_email": email == null ? null : email,
        "user_phone": phone == null ? null : phone,
        "user_address": address == null ? null : address,
        "nick_name": address == null ? null : address,
        "user_photo": address == null ? null : address,
        "created_at": createdAt == null ? null : createdAt!.toIso8601String(),
        "updated_at": updatedAt == null ? null : updatedAt!.toIso8601String(),
      };
}
