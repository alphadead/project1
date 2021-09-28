class PlayerPositionsResponse {
  PlayerPositionsResponse({
    this.success,
    this.message,
    this.data,
  });

  bool? success;
  String? message;
  List<dynamic>? data;

  factory PlayerPositionsResponse.fromJson(Map<String, dynamic> json) =>
      PlayerPositionsResponse(
          success: json["success"] == null ? null : json["success"],
          message: json["message"] == null ? null : json["message"],
          data: json["data"] == null ? null : json["data"]);

  Map<String, dynamic> toJson() => {
        "success": success == null ? null : success,
        "message": message == null ? null : message,
        "data": data == null ? null : data
      };
}
