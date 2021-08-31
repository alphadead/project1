// To parse this JSON data, do
//
//     final welcome = welcomeFromJson(jsonString);

import 'dart:convert';

UpdateGround updateGroundJson(String str) =>
    UpdateGround.fromJson(json.decode(str));

String updateGroundToJson(UpdateGround data) => json.encode(data.toJson());

class UpdateGround {
  UpdateGround({
    this.success,
    this.message,
    this.data,
  });

  bool? success;
  String? message;
  GroundInfo? data;

  factory UpdateGround.fromJson(Map<String, dynamic> json) => UpdateGround(
        success: json["success"],
        message: json["message"],
        data: GroundInfo.fromJson(json["data"]),
      );

  Map<String, dynamic> toJson() => {
        "success": success,
        "message": message,
        "data": data!.toJson(),
      };
}

class GroundInfo {
  GroundInfo({
    this.userId,
    this.id,
    this.name,
    this.location,
    this.latitude,
    this.longitude,
    this.bookingFee,
    this.photo,
  });

  String? userId;
  int? id;
  String? name;
  String? location;
  String? latitude;
  String? longitude;
  String? bookingFee;
  List<dynamic>? photo;

  factory GroundInfo.fromJson(Map<String, dynamic> json) => GroundInfo(
        userId: json["user_id"],
        id: json["id"],
        name: json["name"],
        location: json["location"],
        latitude: json["latitude"],
        longitude: json["longitude"],
        bookingFee: json["booking_fee"],
        photo: List<dynamic>.from(json["photo"].map((x) => x)),
      );

  Map<String, dynamic> toJson() => {
        "user_id": userId,
        "id": id,
        "name": name,
        "location": location,
        "latitude": latitude,
        "longitude": longitude,
        "booking_fee": bookingFee,
        "photo": List<dynamic>.from(photo!.map((x) => x)),
      };
}
