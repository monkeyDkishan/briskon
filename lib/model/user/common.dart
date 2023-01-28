
class ResCommon {
  ResCommon({
    this.status,
    this.message,
  });

  int? status;
  String? message;

  factory ResCommon.fromJson(Map<String, dynamic>? json) => ResCommon(
    status: json?["status"],
    message: json?["message"],
  );

  Map<String, dynamic> toJson() => {
    "status": status,
    "message": message,
  };
}

