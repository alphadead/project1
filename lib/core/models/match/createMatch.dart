// To parse this JSON data, do
//
//     final welcome = welcomeFromJson(jsonString);

import 'dart:convert';

CreateMatch welcomeFromJson(String str) =>
    CreateMatch.fromJson(json.decode(str));

String welcomeToJson(CreateMatch data) => json.encode(data.toJson());

class CreateMatch {
  CreateMatch({
    this.success,
    this.message,
    this.data,
  });

  bool? success;
  String? message;
  MatchData? data;

  factory CreateMatch.fromJson(Map<String, dynamic> json) => CreateMatch(
        success: json["success"],
        message: json["message"],
        data: json["data"] == null ? null : MatchData.fromJson(json["data"]),
      );

  Map<String, dynamic> toJson() => {
        "success": success,
        "message": message,
        "data": data!.toJson(),
      };
}

class MatchData {
  MatchData({
    this.userId,
    this.id,
    this.name,
    this.groundId,
    this.groundName,
    this.groundLocation,
    this.bookingFee,
    this.logo,
    this.createdAt,
    this.updatedAt,
    this.bookingTimeSlots,
  });

  int? userId;
  int? id;
  String? name;
  int? groundId;
  dynamic groundName;
  dynamic groundLocation;
  String? bookingFee;
  String? logo;
  DateTime? createdAt;
  DateTime? updatedAt;
  List<dynamic>? bookingTimeSlots;

  factory MatchData.fromJson(Map<String, dynamic> json) => MatchData(
        userId: json["user_id"],
        id: json["id"],
        name: json["name"],
        groundId: json["ground_id"],
        groundName: json["ground_name"],
        groundLocation: json["ground_location"],
        bookingFee: json["booking_fee"],
        logo: json["logo"],
        createdAt: DateTime.parse(json["created_at"]),
        updatedAt: DateTime.parse(json["updated_at"]),
        bookingTimeSlots:
            List<dynamic>.from(json["booking_time_slots"].map((x) => x)),
      );

  Map<String, dynamic> toJson() => {
        "user_id": userId,
        "id": id,
        "name": name,
        "ground_id": groundId,
        "ground_name": groundName,
        "ground_location": groundLocation,
        "booking_fee": bookingFee,
        "logo": logo,
        "created_at": createdAt!.toIso8601String(),
        "updated_at": updatedAt!.toIso8601String(),
        "booking_time_slots":
            List<dynamic>.from(bookingTimeSlots!.map((x) => x)),
      };
}
