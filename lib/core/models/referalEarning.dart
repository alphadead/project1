// To parse this JSON data, do
//
//     final welcome = welcomeFromJson(jsonString);

import 'dart:convert';

ReferalEarning earningFromJson(String str) =>
    ReferalEarning.fromJson(json.decode(str));

String earningToJson(ReferalEarning data) => json.encode(data.toJson());

class ReferalEarning {
  ReferalEarning({
    this.data,
    this.status,
    this.message,
  });

  Referal? data;
  String? status;
  String? message;

  factory ReferalEarning.fromJson(Map<String, dynamic> json) => ReferalEarning(
        data: Referal.fromJson(json["data"]),
        status: json["status"],
        message: json["message"],
      );

  Map<String, dynamic> toJson() => {
        "data": data!.toJson(),
        "status": status,
        "message": message,
      };
}

class Referal {
  Referal({
    required this.totalReferrer,
    required this.referAmount,
    required this.totalEarning,
  });

  int totalReferrer;
  int referAmount;
  int totalEarning;

  factory Referal.fromJson(Map<String, dynamic> json) => Referal(
        totalReferrer: json["total_referrer"],
        referAmount: json["refer_amount"],
        totalEarning: json["total_earning"],
      );

  Map<String, dynamic> toJson() => {
        "total_referrer": totalReferrer,
        "refer_amount": referAmount,
        "total_earning": totalEarning,
      };
}
