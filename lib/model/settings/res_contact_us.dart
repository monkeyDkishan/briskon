// To parse this JSON data, do
//
//     final resContactUs = resContactUsFromJson(jsonString);

import 'dart:convert';

ResContactUs resContactUsFromJson(String str) => ResContactUs.fromJson(json.decode(str));

String resContactUsToJson(ResContactUs data) => json.encode(data.toJson());

class ResContactUs {
  ResContactUs({
    this.status,
    this.message,
    this.data,
  });

  int? status;
  String? message;
  Data? data;

  factory ResContactUs.fromJson(Map<String, dynamic> json) => ResContactUs(
    status: json["status"],
    message: json["message"],
    data: json["data"] == null ? null : Data.fromJson(json["data"]),
  );

  Map<String, dynamic> toJson() => {
    "status": status,
    "message": message,
    "data": data?.toJson(),
  };
}

class Data {
  Data({
    this.id,
    this.branchId,
    this.email,
    this.mobile,
    this.website,
    this.facebook,
    this.instagram,
    this.twitter,
    this.linkedin,
    this.lat,
    this.long,
    this.address,
    this.isActive,
    this.createdAt,
    this.updatedAt,
  });

  int? id;
  dynamic branchId;
  String? email;
  String? mobile;
  String? website;
  String? facebook;
  String? instagram;
  String? twitter;
  String? linkedin;
  dynamic lat;
  dynamic long;
  String? address;
  int? isActive;
  DateTime? createdAt;
  DateTime? updatedAt;

  factory Data.fromJson(Map<String, dynamic> json) => Data(
    id: json["id"],
    branchId: json["branch_id"],
    email: json["email"],
    mobile: json["mobile"],
    website: json["website"],
    facebook: json["facebook"],
    instagram: json["instagram"],
    twitter: json["twitter"],
    linkedin: json["linkedin"],
    lat: json["lat"],
    long: json["long"],
    address: json["address"],
    isActive: json["is_active"],
    createdAt: json["created_at"] == null ? null : DateTime.parse(json["created_at"]),
    updatedAt: json["updated_at"] == null ? null : DateTime.parse(json["updated_at"]),
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "branch_id": branchId,
    "email": email,
    "mobile": mobile,
    "website": website,
    "facebook": facebook,
    "instagram": instagram,
    "twitter": twitter,
    "linkedin": linkedin,
    "lat": lat,
    "long": long,
    "address": address,
    "is_active": isActive,
    "created_at": createdAt?.toIso8601String(),
    "updated_at": updatedAt?.toIso8601String(),
  };
}
