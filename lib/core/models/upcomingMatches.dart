// To parse this JSON data, do
//
//     final welcome = welcomeFromJson(jsonString);

import 'dart:convert';

UpcomingMatches welcomeFromJson(String str) =>
    UpcomingMatches.fromJson(json.decode(str));

String welcomeToJson(UpcomingMatches data) => json.encode(data.toJson());

class UpcomingMatches {
  UpcomingMatches({
    this.status,
    this.message,
    this.data,
  });

  String? status;
  String? message;
  List<ComingMatch>? data;

  factory UpcomingMatches.fromJson(Map<String, dynamic> json) =>
      UpcomingMatches(
        status: json["status"],
        message: json["message"],
        data: List<ComingMatch>.from(
            json["data"].map((x) => ComingMatch.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "status": status,
        "message": message,
        "data": List<dynamic>.from(data!.map((x) => x.toJson())),
      };
}

class ComingMatch {
  ComingMatch({
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

  int? id;
  String? name;
  String? groundId;
  dynamic groundName;
  dynamic groundLocation;
  String? bookingFee;
  String? logo;
  DateTime? createdAt;
  DateTime? updatedAt;
  List<BookingTimeSlot>? bookingTimeSlots;

  factory ComingMatch.fromJson(Map<String, dynamic> json) => ComingMatch(
        id: json["id"],
        name: json["name"],
        groundId: json["ground_id"],
        groundName: json["ground_name"],
        groundLocation: json["ground_location"],
        bookingFee: json["booking_fee"],
        logo: json["logo"],
        createdAt: DateTime.parse(json["created_at"]),
        updatedAt: DateTime.parse(json["updated_at"]),
        bookingTimeSlots: List<BookingTimeSlot>.from(
            json["booking_time_slots"].map((x) => BookingTimeSlot.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
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
            List<dynamic>.from(bookingTimeSlots!.map((x) => x.toJson())),
      };
}

class BookingTimeSlot {
  BookingTimeSlot({
    this.matchId,
    this.date,
    this.openingTime,
    this.closingTime,
    this.slotTime,
  });

  String? matchId;
  DateTime? date;
  String? openingTime;
  String? closingTime;
  String? slotTime;

  factory BookingTimeSlot.fromJson(Map<String, dynamic> json) =>
      BookingTimeSlot(
        matchId: json["match_id"],
        date: DateTime.parse(json["date"]),
        openingTime: json["opening_time"],
        closingTime: json["closing_time"],
        slotTime: json["slot_time"],
      );

  Map<String, dynamic> toJson() => {
        "match_id": matchId,
        "date":
            "${date!.year.toString().padLeft(4, '0')}-${date!.month.toString().padLeft(2, '0')}-${date!.day.toString().padLeft(2, '0')}",
        "opening_time": openingTime,
        "closing_time": closingTime,
        "slot_time": slotTime,
      };
}
