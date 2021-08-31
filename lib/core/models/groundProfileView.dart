// To parse this JSON data, do
//
//     final GroundProfileViewResponse = GroundProfileViewResponseFromJson(jsonString);

import 'dart:convert';

GroundProfileViewResponse GroundProfileViewResponseFromJson(String str) =>
    GroundProfileViewResponse.fromJson(json.decode(str));

String GroundProfileViewResponseToJson(GroundProfileViewResponse data) =>
    json.encode(data.toJson());

class GroundProfileViewResponse {
  GroundProfileViewResponse({
    required this.success,
    required this.message,
    required this.data,
  });

  bool success;
  String message;
  Data? data;

  factory GroundProfileViewResponse.fromJson(Map<String, dynamic> json) =>
      GroundProfileViewResponse(
        success: json["success"],
        message: json["message"],
        data: Data.fromJson(json["data"]),
      );

  Map<String, dynamic> toJson() => {
        "success": success,
        "message": message,
        "data": data?.toJson(),
      };
}

class Data {
  Data({
    required this.userId,
    required this.id,
    required this.name,
    required this.location,
    required this.latitude,
    required this.longitude,
    required this.bookingFee,
    required this.photo,
  });

  String userId;
  int id;
  String name;
  String location;
  String? latitude;
  String? longitude;
  String bookingFee;
  List<dynamic> photo;

  factory Data.fromJson(Map<String, dynamic> json) => Data(
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
        "photo": List<dynamic>.from(photo.map((x) => x)),
      };
}
