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
  List<AvailableSlot>? availableSlots;

  factory Grounds.fromJson(Map<String, dynamic> json) => Grounds(
        id: json["id"],
        name: json["name"],
        location: json["location"],
        latitude: json["latitude"] == null ? null : json["latitude"],
        longitude: json["longitude"] == null ? null : json["longitude"],
        bookingFee: json["booking_fee"] == null ? null : json["booking_fee"],
        photo: List<dynamic>.from(json["photo"].map((x) => x)),
        availableSlots: List<AvailableSlot>.from(
            json["available_slots"].map((x) => AvailableSlot.fromJson(x))),
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
            List<dynamic>.from(availableSlots!.map((x) => x.toJson())),
      };
}

class AvailableSlot {
  AvailableSlot({
    this.groundId,
    this.date,
    this.openingTime,
    this.closingTime,
    this.slotTime,
    this.costPerSlot,
    this.eventDetails,
  });

  String? groundId;
  DateTime? date;
  String? openingTime;
  String? closingTime;
  String? slotTime;
  String? costPerSlot;
  String? eventDetails;

  factory AvailableSlot.fromJson(Map<String, dynamic> json) => AvailableSlot(
        groundId: json["ground_id"],
        date: DateTime.parse(json["date"]),
        openingTime: json["opening_time"],
        closingTime: json["closing_time"],
        slotTime: json["slot_time"],
        costPerSlot: json["cost_per_slot"],
        eventDetails: json["event_details"],
      );

  Map<String, dynamic> toJson() => {
        "ground_id": groundId,
        "date":
            "${date!.year.toString().padLeft(4, '0')}-${date!.month.toString().padLeft(2, '0')}-${date!.day.toString().padLeft(2, '0')}",
        "opening_time": openingTime,
        "closing_time": closingTime,
        "slot_time": slotTime,
        "cost_per_slot": costPerSlot,
        "event_details": eventDetails,
      };
}
