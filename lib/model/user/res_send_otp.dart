
class ResSendOtp {
  ResSendOtp({
    this.status,
    this.message,
    this.data,
  });

  int? status;
  String? message;
  Data? data;

  factory ResSendOtp.fromJson(Map<String, dynamic>? json) => ResSendOtp(
    status: json?["status"],
    message: json?["message"],
    data: json?["data"] == null ? null : Data.fromJson(json?["data"]),
  );

  Map<String, dynamic> toJson() => {
    "status": status,
    "message": message,
    "data": data?.toJson(),
  };
}

class Data {
  Data({
    this.mobile,
    this.otp,
    this.updatedAt,
    this.createdAt,
    this.id,
  });

  String? mobile;
  int? otp;
  DateTime? updatedAt;
  DateTime? createdAt;
  int? id;

  factory Data.fromJson(Map<String, dynamic> json) => Data(
    mobile: json["mobile"],
    otp: json["otp"],
    updatedAt: json["updated_at"] == null ? null : DateTime.parse(json["updated_at"]),
    createdAt: json["created_at"] == null ? null : DateTime.parse(json["created_at"]),
    id: json["id"],
  );

  Map<String, dynamic> toJson() => {
    "mobile": mobile,
    "otp": otp,
    "updated_at": updatedAt?.toIso8601String(),
    "created_at": createdAt?.toIso8601String(),
    "id": id,
  };
}
