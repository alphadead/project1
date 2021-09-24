class TeamSizesResponse {
  TeamSizesResponse({
    this.success,
    this.message,
    this.data,
  });

  String? success;
  String? message;
  Map<String, dynamic>? data;

  factory TeamSizesResponse.fromJson(Map<String, dynamic> json) =>
      TeamSizesResponse(
          success: json["success"] == null ? null : json["success"],
          message: json["message"] == null ? null : json["message"],
          data: json["data"] == null ? null : json["data"]);

  Map<String, dynamic> toJson() => {
        "success": success == null ? null : success,
        "message": message == null ? null : message,
        "data": data == null ? null : data
      };
}
