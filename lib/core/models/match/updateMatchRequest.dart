class UpdateMatchRequestsByTeam {
  UpdateMatchRequestsByTeam({
    this.success,
    this.message,
    this.data,
  });

  bool? success;
  String? message;
  dynamic data;

  factory UpdateMatchRequestsByTeam.fromJson(Map<String, dynamic> json) =>
      UpdateMatchRequestsByTeam(
          success: json["success"],
          message: json["message"],
          data: json["data"]);
          
  Map<String, dynamic> toJson() => {
        "success": success,
        "message": message,
        "data": data!.toJson(),
      };
}
