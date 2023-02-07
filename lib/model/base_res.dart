// To parse this JSON data, do
//
//     final baseRes = baseResFromJson(jsonString);

import 'dart:convert';

BaseRes baseResFromJson(String str) => BaseRes.fromJson(json.decode(str));

String baseResToJson(BaseRes data) => json.encode(data.toJson());

class BaseRes {
  BaseRes({
    this.status,
    this.message,
  });

  int? status;
  String? message;

  factory BaseRes.fromJson(Map<String, dynamic> json) => BaseRes(
    status: json["status"],
    message: json["message"],
  );

  Map<String, dynamic> toJson() => {
    "status": status,
    "message": message,
  };
}
