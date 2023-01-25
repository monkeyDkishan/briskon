
class ResVerifyOtp {
  ResVerifyOtp({
    this.status,
    this.message,
    this.data,
  });

  int? status;
  String? message;
  Data? data;

  factory ResVerifyOtp.fromJson(Map<String, dynamic>? json) => ResVerifyOtp(
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
    this.isVerifed,
    this.userId,
    this.authToken,
  });

  int? isVerifed;
  int? userId;
  String? authToken;

  factory Data.fromJson(Map<String, dynamic> json) => Data(
    isVerifed: json["is_verifed"],
    userId: json["user_id"],
    authToken: json["auth_token"],
  );

  Map<String, dynamic> toJson() => {
    "is_verifed": isVerifed,
    "user_id": userId,
    "auth_token": authToken,
  };
}
