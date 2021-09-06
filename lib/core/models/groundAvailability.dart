// To parse this JSON data, do
//
//     final welcome = welcomeFromJson(jsonString);

import 'dart:convert';

GroundAvailability welcomeFromJson(String str) =>
    GroundAvailability.fromJson(json.decode(str));

String welcomeToJson(GroundAvailability data) => json.encode(data.toJson());

class GroundAvailability {
  GroundAvailability({
    this.success,
    this.message,
    this.data,
  });

  bool? success;
  String? message;
  List<Datum>? data;

  factory GroundAvailability.fromJson(Map<String, dynamic> json) =>
      GroundAvailability(
        success: json["success"],
        message: json["message"],
        data: json["data"] == null
            ? null
            : List<Datum>.from(json["data"].map((x) => Datum.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "success": success,
        "message": message,
        "data": data,
      };
}

class Datum {
  Datum({this.slotStartTime, this.slotEndTime, this.slotTime});

  String? slotStartTime;
  String? slotEndTime;
  String? slotTime;

  factory Datum.fromJson(Map<String, dynamic> json) => Datum(
      slotStartTime: json["slot_start_time"] == null
          ? null
          : json["slot_start_time"]
              .toString()
              .split(":")
              .sublist(0, 2)
              .join(":"),
      slotEndTime: json["slot_end_time"] == null
          ? null
          : json["slot_end_time"].toString().split(":").sublist(0, 2).join(":"),
      slotTime: json["slot_time"]);

  Map<String, dynamic> toJson() => {
        "slot_start_time": slotStartTime,
        "slot_end_time": slotEndTime,
        "slot_time": slotTime
      };
}
