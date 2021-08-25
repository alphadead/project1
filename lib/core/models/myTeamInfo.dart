// To parse this JSON data, do
//
//     final MyTeamInfo = MyTeamInfoFromJson(jsonString);

import 'dart:convert';

MyTeamInfo myTeamInfoFromJson(String str) =>
    MyTeamInfo.fromJson(json.decode(str));

String myTeamInfoToJson(MyTeamInfo data) => json.encode(data.toJson());

class MyTeamInfo {
  MyTeamInfo({
    this.status,
    this.message,
    this.data,
  });

  String? status;
  String? message;
  TeamInfo? data;

  factory MyTeamInfo.fromJson(Map<String, dynamic> json) => MyTeamInfo(
        status: json["status"],
        message: json["message"],
        data: json["data"] == null? null: TeamInfo.fromJson(json["data"]),
      );

  Map<String, dynamic> toJson() => {
        "status": status,
        "message": message,
        "data": data!.toJson(),
      };
}

class TeamInfo {
  TeamInfo({
    this.id,
    this.name,
    this.teamSize,
    this.logo,
  });

  int? id;
  String? name;
  dynamic teamSize;
  String? logo;

  factory TeamInfo.fromJson(Map<String, dynamic> json) => TeamInfo(
        id: json["id"],
        name: json["name"],
        teamSize: json["team_size"],
        logo: json["logo"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "team_size": teamSize,
        "logo": logo,
      };
}
