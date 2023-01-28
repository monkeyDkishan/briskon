class ResUser {
  ResUser({
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

  factory ResUser.fromJson(Map<String, dynamic> json) => ResUser(
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