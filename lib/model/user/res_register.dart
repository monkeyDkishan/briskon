class ResRegister {
  ResRegister({
    this.status,
    this.message,
    this.data,
  });

  int? status;
  String? message;
  Data? data;

  factory ResRegister.fromJson(Map<String, dynamic> json) => ResRegister(
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
    this.associationId,
    this.associationType,
    this.companyName,
    this.userName,
    this.designation,
    this.updatedAt,
    this.createdAt,
    this.id,
    this.member,
  });

  int? associationId;
  String? associationType;
  String? companyName;
  String? userName;
  String? designation;
  DateTime? updatedAt;
  DateTime? createdAt;
  int? id;
  Member? member;

  factory Data.fromJson(Map<String, dynamic> json) => Data(
    associationId: json["association_id"],
    associationType: json["association_type"],
    companyName: json["company_name"],
    userName: json["user_name"],
    designation: json["designation"],
    updatedAt: json["updated_at"] == null ? null : DateTime.parse(json["updated_at"]),
    createdAt: json["created_at"] == null ? null : DateTime.parse(json["created_at"]),
    id: json["id"],
    member: json["member"] == null ? null : Member.fromJson(json["member"]),
  );

  Map<String, dynamic> toJson() => {
    "association_id": associationId,
    "association_type": associationType,
    "company_name": companyName,
    "user_name": userName,
    "designation": designation,
    "updated_at": updatedAt?.toIso8601String(),
    "created_at": createdAt?.toIso8601String(),
    "id": id,
    "member": member?.toJson(),
  };
}

class Member {
  Member({
    this.firstName,
    this.lastName,
    this.email,
    this.phone,
    this.displayName,
    this.authToken,
    this.fcmToken,
    this.roleType,
    this.isActive,
    this.updatedAt,
    this.createdAt,
    this.id,
  });

  String? firstName;
  String? lastName;
  String? email;
  String? phone;
  String? displayName;
  String? authToken;
  String? fcmToken;
  String? roleType;
  int? isActive;
  DateTime? updatedAt;
  DateTime? createdAt;
  int? id;

  factory Member.fromJson(Map<String, dynamic> json) => Member(
    firstName: json["first_name"],
    lastName: json["last_name"],
    email: json["email"],
    phone: json["phone"],
    displayName: json["display_name"],
    authToken: json["auth_token"],
    fcmToken: json["fcm_token"],
    roleType: json["role_type"],
    isActive: json["is_active"],
    updatedAt: json["updated_at"] == null ? null : DateTime.parse(json["updated_at"]),
    createdAt: json["created_at"] == null ? null : DateTime.parse(json["created_at"]),
    id: json["id"],
  );

  Map<String, dynamic> toJson() => {
    "first_name": firstName,
    "last_name": lastName,
    "email": email,
    "phone": phone,
    "display_name": displayName,
    "auth_token": authToken,
    "fcm_token": fcmToken,
    "role_type": roleType,
    "is_active": isActive,
    "updated_at": updatedAt?.toIso8601String(),
    "created_at": createdAt?.toIso8601String(),
    "id": id,
  };
}
