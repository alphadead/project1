import 'dart:convert';

MatchListResponse matchListResponse(
        String str) =>
    MatchListResponse.fromJson(json.decode(str));

String matchListResponseToJson(
        MatchListResponse data) =>
    json.encode(data.toJson());

class MatchListResponse {
  MatchListResponse({
    this.status,
    this.message,
    this.data,
  });

  String? status;
  String? message;
  List<Match>? data;

  factory MatchListResponse.fromJson(
          Map<String, dynamic> json) =>
      MatchListResponse(
        status: json["status"] == null ? null : json["status"],
        message: json["message"] == null ? null : json["message"],
        data: json["data"] == null
            ? null
            : List<Match>.from(json["data"].map((x) => Match.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "status": status == null ? null : status,
        "message": message == null ? null : message,
        "data": data == null
            ? null
            : List<dynamic>.from(data!.map((x) => x.toJson())),
      };
}

class Match {
  Match({
    this.id,
    this.name,
    this.groundId,
    this.groundName,
    this.groundLocation,
    this.bookingFee,
    this.bookingTimeSlots,
    this.status
  });

  int? id;
  String? name;
  String? groundId;
  String? groundName;
  String? groundLocation;
  String? bookingFee;
  String? status;
  List? bookingTimeSlots;

  factory Match.fromJson(Map<String, dynamic> json) => Match(
        id: json["id"] == null ? null : json["id"],
        name: json["name"] == null ? null : json["name"],
        groundId: json["ground_id"] == null ? null : json["ground_id"],
        groundName: json["ground_name"] == null ? null : json["ground_name"],
        groundLocation: json["ground_location"] == null ? null : json["ground_location"],
        bookingFee: json["booking_fee"] == null ? null : json["booking_fee"],
        bookingTimeSlots: json["booking_time_slots"] == null ? null : json["booking_time_slots"],
        status: json["status"] == null ? null : json["status"],
      );

  Map<String, dynamic> toJson() => {
        "id": id == null ? null : id,
        "ground_id": groundId == null ? null : groundId,
        "ground_name": groundName == null ? null : groundName,
        "name": name == null ? null : name,
        "ground_location": groundLocation == null ? null : groundLocation,
        "booking_time_slots": bookingTimeSlots == null ? null : bookingTimeSlots,
        "status": status == null ? null : status,
        "booking_fee": bookingFee == null ? null : bookingFee,
      };
}
