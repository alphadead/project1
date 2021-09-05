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
  Map<String, Datum>? data;

  factory GroundAvailability.fromJson(Map<String, dynamic> json) =>
      GroundAvailability(
        success: json["success"],
        message: json["message"],
        data: Map.from(json["data"])
            .map((k, v) => MapEntry<String, Datum>(k, Datum.fromJson(v))),
      );

  Map<String, dynamic> toJson() => {
        "success": success,
        "message": message,
        "data": Map.from(data!)
            .map((k, v) => MapEntry<String, dynamic>(k, v.toJson())),
      };
}

class Datum {
  Datum({
    this.slotStartTime,
    this.slotEndTime,
  });

  String? slotStartTime;
  String? slotEndTime;

  factory Datum.fromJson(Map<String, dynamic> json) => Datum(
        slotStartTime: json["slot_start_time"],
        slotEndTime: json["slot_end_time"],
      );

  Map<String, dynamic> toJson() => {
        "slot_start_time": slotStartTime,
        "slot_end_time": slotEndTime,
      };
}
