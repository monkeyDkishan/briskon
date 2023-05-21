
class ResGetDistributorList {
  int? status;
  String? message;
  List<Datum>? data;

  ResGetDistributorList({
    this.status,
    this.message,
    this.data,
  });

  factory ResGetDistributorList.fromJson(Map<String, dynamic> json) => ResGetDistributorList(
    status: json["status"],
    message: json["message"],
    data: json["data"] == null ? [] : List<Datum>.from(json["data"]!.map((x) => Datum.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "status": status,
    "message": message,
    "data": data == null ? [] : List<dynamic>.from(data!.map((x) => x.toJson())),
  };
}

class Datum {
  int? distributorId;
  String? name;
  String? mobile;
  String? email;
  dynamic image;
  String? location;
  int? addressId;
  int? isActive;
  DateTime? createdAt;
  DateTime? updatedAt;
  String? addressLine1;
  String? addressLine2;
  String? city;
  String? state;
  String? country;
  String? postalCode;
  String? lat;
  String? long;

  Datum({
    this.distributorId,
    this.name,
    this.mobile,
    this.email,
    this.image,
    this.location,
    this.addressId,
    this.isActive,
    this.createdAt,
    this.updatedAt,
    this.addressLine1,
    this.addressLine2,
    this.city,
    this.state,
    this.country,
    this.postalCode,
    this.lat,
    this.long,
  });

  factory Datum.fromJson(Map<String, dynamic> json) => Datum(
    distributorId: json["distributor_id"],
    name: json["name"],
    mobile: json["mobile"],
    email: json["email"],
    image: json["image"],
    location: json["location"],
    addressId: json["address_id"],
    isActive: json["is_active"],
    createdAt: json["created_at"] == null ? null : DateTime.parse(json["created_at"]),
    updatedAt: json["updated_at"] == null ? null : DateTime.parse(json["updated_at"]),
    addressLine1: json["address_line_1"],
    addressLine2: json["address_line_2"],
    city: json["city"],
    state: json["state"],
    country: json["country"],
    postalCode: json["postal_code"],
    lat: json["lat"],
    long: json["long"],
  );

  Map<String, dynamic> toJson() => {
    "distributor_id": distributorId,
    "name": name,
    "mobile": mobile,
    "email": email,
    "image": image,
    "location": location,
    "address_id": addressId,
    "is_active": isActive,
    "created_at": createdAt?.toIso8601String(),
    "updated_at": updatedAt?.toIso8601String(),
    "address_line_1": addressLine1,
    "address_line_2": addressLine2,
    "city": city,
    "state": state,
    "country": country,
    "postal_code": postalCode,
    "lat": lat,
    "long": long,
  };
}
