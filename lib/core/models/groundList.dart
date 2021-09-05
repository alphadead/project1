// To parse this JSON data, do
//
//     final welcome = welcomeFromJson(jsonString);

import 'dart:convert';

GroundList welcomeFromJson(String str) => GroundList.fromJson(json.decode(str));

String welcomeToJson(GroundList data) => json.encode(data.toJson());

class GroundList {
  GroundList({
    this.success,
    this.message,
    this.data,
  });

  bool? success;
  String? message;
  List<Grounds>? data;

  factory GroundList.fromJson(Map<String, dynamic> json) => GroundList(
        success: json["success"],
        message: json["message"],
        data: List<Grounds>.from(json["data"].map((x) => Grounds.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "success": success,
        "message": message,
        "data": List<dynamic>.from(data!.map((x) => x.toJson())),
      };
}

class Grounds {
  Grounds({
    this.id,
    this.name,
    this.location,
    this.latitude,
    this.longitude,
    this.bookingFee,
    this.photo,
    this.availableSlots,
  });

  int? id;
  String? name;
  String? location;
  String? latitude;
  String? longitude;
  String? bookingFee;
  List<dynamic>? photo;
  List<dynamic>? availableSlots;

  factory Grounds.fromJson(Map<String, dynamic> json) => Grounds(
        id: json["id"],
        name: json["name"],
        location: json["location"],
        latitude: json["latitude"] == null ? null : json["latitude"],
        longitude: json["longitude"] == null ? null : json["longitude"],
        bookingFee: json["booking_fee"] == null ? null : json["booking_fee"],
        photo: List<dynamic>.from(json["photo"].map((x) => x)),
        availableSlots: json["available_slots"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "location": location,
        "latitude": latitude == null ? null : latitude,
        "longitude": longitude == null ? null : longitude,
        "booking_fee": bookingFee == null ? null : bookingFee,
        "photo": List<dynamic>.from(photo!.map((x) => x)),
        "available_slots":
            List<dynamic>.from(availableSlots!.map((x) => x)),
      };
}
