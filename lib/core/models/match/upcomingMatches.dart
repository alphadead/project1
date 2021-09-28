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
  ComingMatch(
      {this.id,
      this.name,
      this.groundId,
      this.groundName,
      this.groundLocation,
      this.bookingFee,
      this.logo,
      this.createdAt,
      this.updatedAt,
      this.matchTeams,
      this.teamSize});

  int? id;
  String? name;
  String? groundId;
  String? groundName;
  String? groundLocation;
  String? bookingFee;
  String? logo;
  DateTime? createdAt;
  DateTime? updatedAt;
  List<MatchTeam>? matchTeams;
  String? teamSize;

  factory ComingMatch.fromJson(Map<String, dynamic> json) => ComingMatch(
      id: json["id"],
      name: json["name"],
      groundId: json["ground_id"] == null ? null : json["ground_id"],
      groundName: json["ground_name"] == null ? null : json["ground_name"],
      groundLocation:
          json["ground_location"] == null ? null : json["ground_location"],
      bookingFee: json["booking_fee"] == null ? null : json["booking_fee"],
      logo: json["logo"],
      createdAt: DateTime.parse(json["created_at"]),
      updatedAt: DateTime.parse(json["updated_at"]),
      matchTeams: List<MatchTeam>.from(
          json["match_teams"].map((x) => MatchTeam.fromJson(x))),
      teamSize: json["team_size"] == null ? null : json["team_size"]);

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "ground_id": groundId == null ? null : groundId,
        "ground_name": groundName == null ? null : groundName,
        "ground_location": groundLocation == null ? null : groundLocation,
        "booking_fee": bookingFee == null ? null : bookingFee,
        "logo": logo,
        "created_at": createdAt!.toIso8601String(),
        "updated_at": updatedAt!.toIso8601String(),
        "match_teams": List<dynamic>.from(matchTeams!.map((x) => x.toJson())),
        "team_size": teamSize == null ? null : teamSize
      };
}

class MatchTeam {
  MatchTeam({
    this.teamId,
    this.teamName,
    this.teamLogo,
    this.teamPlayers,
  });

  String? teamId;
  String? teamName;
  String? teamLogo;
  List<TeamPlayer>? teamPlayers;

  factory MatchTeam.fromJson(Map<String, dynamic> json) => MatchTeam(
        teamId: json["team_id"],
        teamName: json["team_name"],
        teamLogo: json["team_logo"],
        teamPlayers: json["team_players"] == null
            ? null
            : List<TeamPlayer>.from(
                json["team_players"].map((x) => TeamPlayer.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "team_id": teamId,
        "team_name": teamName,
        "team_logo": teamLogo,
        "team_players": teamPlayers == null
            ? null
            : List<dynamic>.from(teamPlayers!.map((x) => x.toJson())),
      };
}

class TeamPlayer {
  TeamPlayer({this.playerId, this.playerName, this.position, this.playerPhoto});

  String? playerId;
  String? playerName;
  String? position;
  String? playerPhoto;

  factory TeamPlayer.fromJson(Map<String, dynamic> json) => TeamPlayer(
        playerId: json["player_id"] == null ? null : json["player_id"],
        playerName: json["player_name"] == null ? null : json["player_name"],
        position: json["position"] == null ? null : json["position"],
        playerPhoto: json["player_photo"] == null ? null : json["player_photo"],
      );

  Map<String, dynamic> toJson() => {
        "player_id": playerId == null ? null : playerId,
        "player_name": playerName == null ? null : playerName,
        "position": position == null ? null : position,
        "player_photo": playerPhoto == null ? null : playerPhoto,
      };
}
