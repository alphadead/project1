// To parse this JSON data, do
//
//     final updateGround = updateGroundFromJson(jsonString);

import 'dart:convert';

UpdateGround updateGroundFromJson(String str) =>
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
  Data? data;

  factory UpdateGround.fromJson(Map<String, dynamic> json) => UpdateGround(
        success: json["success"] == null ? null : json["success"],
        message: json["message"] == null ? null : json["message"],
        data: json["data"] == null ? null : Data.fromJson(json["data"]),
      );

  Map<String, dynamic> toJson() => {
        "success": success == null ? null : success,
        "message": message == null ? null : message,
        "data": data == null ? null : data!.toJson(),
      };
}

class Data {
  Data({
    this.userId,
    this.id,
    this.name,
    this.location,
    this.latitude,
    this.longitude,
    this.bookingFee,
    this.photo,
    this.availableSlots,
  });

  String? userId;
  int? id;
  String? name;
  String? location;
  dynamic latitude;
  dynamic longitude;
  String? bookingFee;
  List<dynamic>? photo;
  List<AvailableSlot>? availableSlots;

  factory Data.fromJson(Map<String, dynamic> json) => Data(
        userId: json["user_id"] == null ? null : json["user_id"],
        id: json["id"] == null ? null : json["id"],
        name: json["name"] == null ? null : json["name"],
        location: json["location"] == null ? null : json["location"],
        latitude: json["latitude"],
        longitude: json["longitude"],
        bookingFee: json["booking_fee"] == null ? null : json["booking_fee"],
        photo: json["photo"] == null
            ? null
            : List<dynamic>.from(json["photo"].map((x) => x)),
        availableSlots: json["available_slots"] == null
            ? null
            : List<AvailableSlot>.from(
                json["available_slots"].map((x) => AvailableSlot.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "user_id": userId == null ? null : userId,
        "id": id == null ? null : id,
        "name": name == null ? null : name,
        "location": location == null ? null : location,
        "latitude": latitude,
        "longitude": longitude,
        "booking_fee": bookingFee == null ? null : bookingFee,
        "photo":
            photo == null ? null : List<dynamic>.from(photo!.map((x) => x)),
        "available_slots": availableSlots == null
            ? null
            : List<dynamic>.from(availableSlots!.map((x) => x.toJson())),
      };
}

class AvailableSlot {
  AvailableSlot({
    this.groundId,
    this.date,
    this.openingTime,
    this.closingTime,
    this.slotTime,
    this.eventDetails,
  });

  String? groundId;
  DateTime? date;
  String? openingTime;
  String? closingTime;
  String? slotTime;
  String? eventDetails;

  factory AvailableSlot.fromJson(Map<String, dynamic> json) => AvailableSlot(
        groundId: json["ground_id"] == null ? null : json["ground_id"],
        date: json["date"] == null ? null : DateTime.parse(json["date"]),
        openingTime: json["opening_time"] == null ? null : json["opening_time"],
        closingTime: json["closing_time"] == null ? null : json["closing_time"],
        slotTime: json["slot_time"] == null ? null : json["slot_time"],
        eventDetails:
            json["event_details"] == null ? null : json["event_details"],
      );

  Map<String, dynamic> toJson() => {
        "ground_id": groundId == null ? null : groundId,
        "date": date == null
            ? null
            : "${date!.year.toString().padLeft(4, '0')}-${date!.month.toString().padLeft(2, '0')}-${date!.day.toString().padLeft(2, '0')}",
        "opening_time": openingTime == null ? null : openingTime,
        "closing_time": closingTime == null ? null : closingTime,
        "slot_time": slotTime == null ? null : slotTime,
        "event_details": eventDetails == null ? null : eventDetails,
      };
}
