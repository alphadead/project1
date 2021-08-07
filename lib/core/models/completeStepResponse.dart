import 'dart:convert';

List<CompletedStepResponse> loginResponseFromJson(String str) =>
    List<CompletedStepResponse>.from(
        json.decode(str).map((x) => CompletedStepResponse.fromJson(x)));

String loginResponseToJson(List<CompletedStepResponse> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class CompletedStepResponse {
  CompletedStepResponse({
    this.data,
    this.message,
    this.status,
    this.success,
  });

  Data? data;
  String? message;
  String? status;
  bool? success;

  factory CompletedStepResponse.fromJson(Map<String, dynamic> json) =>
      CompletedStepResponse(
          data: json["data"] == null ? null : Data.fromJson(json["data"]),
          message: json["message"],
          success: json["success"],
          status: json["status"] == null ? null : json["status"]);

  Map<String, dynamic> toJson() => {
        "data": data == null ? null : data!.toJson(),
        "message": message,
        "status": status == null ? null : status,
        "success": success
      };
}

class Data {
  Data({this.id, this.completedStep});

  int? id;
  String? completedStep;

  factory Data.fromJson(Map<String, dynamic> json) =>
      Data(id: json["id"], completedStep: json["completed_step"]);

  Map<String, dynamic> toJson() => {"id": id, "completed_step": completedStep};
}