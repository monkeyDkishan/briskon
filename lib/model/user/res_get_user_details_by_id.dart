
import 'package:briskon/services/server_config.dart';

class ResGetUserDetailsById {
  ResGetUserDetailsById({
    this.status,
    this.message,
    this.data,
  });

  int? status;
  String? message;
  Data? data;

  factory ResGetUserDetailsById.fromJson(Map<String, dynamic> json) => ResGetUserDetailsById(
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
    this.associationId,
    this.associationType,
    this.userName,
    this.companyName,
    this.designation,
    this.addressId,
    this.kycId,
    this.branchId,
    this.createdAt,
    this.updatedAt,
    this.address,
    this.member,
  });

  int? id;
  String? associationId;
  String? associationType;
  String? userName;
  String? companyName;
  String? designation;
  int? addressId;
  int? kycId;
  dynamic branchId;
  DateTime? createdAt;
  DateTime? updatedAt;
  Address? address;
  Member? member;

  factory Data.fromJson(Map<String, dynamic> json) => Data(
    id: json["id"],
    associationId: json["association_id"],
    associationType: json["association_type"],
    userName: json["user_name"],
    companyName: json["company_name"],
    designation: json["designation"],
    addressId: json["address_id"],
    kycId: json["kyc_id"],
    branchId: json["branch_id"],
    createdAt: json["created_at"] == null ? null : DateTime.parse(json["created_at"]),
    updatedAt: json["updated_at"] == null ? null : DateTime.parse(json["updated_at"]),
    address: json["address"] == null ? null : Address.fromJson(json["address"]),
    member: json["member"] == null ? null : Member.fromJson(json["member"]),
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "association_id": associationId,
    "association_type": associationType,
    "user_name": userName,
    "company_name": companyName,
    "designation": designation,
    "address_id": addressId,
    "kyc_id": kycId,
    "branch_id": branchId,
    "created_at": createdAt?.toIso8601String(),
    "updated_at": updatedAt?.toIso8601String(),
    "address": address?.toJson(),
    "member": member?.toJson(),
  };
}

class Address {
  Address({
    this.id,
    this.userId,
    this.addressLine1,
    this.addressLine2,
    this.city,
    this.state,
    this.country,
    this.postalCode,
    this.lat,
    this.long,
    this.isActive,
    this.createdAt,
    this.updatedAt,
  });

  int? id;
  int? userId;
  String? addressLine1;
  String? addressLine2;
  String? city;
  String? state;
  String? country;
  String? postalCode;
  String? lat;
  String? long;
  int? isActive;
  DateTime? createdAt;
  DateTime? updatedAt;

  factory Address.fromJson(Map<String, dynamic> json) => Address(
    id: json["id"],
    userId: json["user_id"],
    addressLine1: json["address_line_1"],
    addressLine2: json["address_line_2"],
    city: json["city"],
    state: json["state"],
    country: json["country"],
    postalCode: json["postal_code"],
    lat: json["lat"],
    long: json["long"],
    isActive: json["is_active"],
    createdAt: json["created_at"] == null ? null : DateTime.parse(json["created_at"]),
    updatedAt: json["updated_at"] == null ? null : DateTime.parse(json["updated_at"]),
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "user_id": userId,
    "address_line_1": addressLine1,
    "address_line_2": addressLine2,
    "city": city,
    "state": state,
    "country": country,
    "postal_code": postalCode,
    "lat": lat,
    "long": long,
    "is_active": isActive,
    "created_at": createdAt?.toIso8601String(),
    "updated_at": updatedAt?.toIso8601String(),
  };
}

class Member {
  Member({
    this.id,
    this.firstName,
    this.lastName,
    this.email,
    this.phone,
    this.displayName,
    this.fcmToken,
    this.authToken,
    this.roleType,
    this.profilePic,
    this.isActive,
    this.isNotification,
    this.isDeleted,
    this.createdAt,
    this.updatedAt,
  });

  int? id;
  String? firstName;
  String? lastName;
  String? email;
  String? phone;
  String? displayName;
  String? fcmToken;
  String? authToken;
  String? roleType;
  String? profilePic;
  int? isActive;
  int? isNotification;
  int? isDeleted;
  DateTime? createdAt;
  DateTime? updatedAt;

  get imageUrl => "${ServerConfig.domain}/${profilePic ?? ""}";

  factory Member.fromJson(Map<String, dynamic> json) => Member(
    id: json["id"],
    firstName: json["first_name"],
    lastName: json["last_name"],
    email: json["email"],
    phone: json["phone"],
    displayName: json["display_name"],
    fcmToken: json["fcm_token"],
    authToken: json["auth_token"],
    roleType: json["role_type"],
    profilePic: json["profile_pic"],
    isActive: json["is_active"],
    isNotification: json["is_notification"],
    isDeleted: json["is_deleted"],
    createdAt: json["created_at"] == null ? null : DateTime.parse(json["created_at"]),
    updatedAt: json["updated_at"] == null ? null : DateTime.parse(json["updated_at"]),
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "first_name": firstName,
    "last_name": lastName,
    "email": email,
    "phone": phone,
    "display_name": displayName,
    "fcm_token": fcmToken,
    "auth_token": authToken,
    "role_type": roleType,
    "profile_pic": profilePic,
    "is_active": isActive,
    "is_notification": isNotification,
    "is_deleted": isDeleted,
    "created_at": createdAt?.toIso8601String(),
    "updated_at": updatedAt?.toIso8601String(),
  };
}
