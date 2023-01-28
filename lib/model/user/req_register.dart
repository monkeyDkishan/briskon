class ReqRegister {
  ReqRegister({
    this.firstName,
    this.lastName,
    this.email,
    this.mobile,
    this.fcmToken,
    this.addressLine1,
    this.addressLine2,
    this.city,
    this.state,
    this.postalCode,
    this.lat,
    this.long,
    this.country,
    this.companyName,
    this.designation,
  });

  String? firstName;
  String? lastName;
  String? email;
  String? mobile;
  String? fcmToken;
  String? addressLine1;
  String? addressLine2;
  String? city;
  String? state;
  String? postalCode;
  double? lat;
  double? long;
  String? country;
  String? companyName;
  String? designation;

  factory ReqRegister.fromJson(Map<String, dynamic> json) => ReqRegister(
    firstName: json["first_name"],
    lastName: json["last_name"],
    email: json["email"],
    mobile: json["mobile"],
    fcmToken: json["fcm_token"],
    addressLine1: json["address_line_1"],
    addressLine2: json["address_line_2"],
    city: json["city"],
    state: json["state"],
    postalCode: json["postal_code"],
    lat: json["lat"]?.toDouble(),
    long: json["long"]?.toDouble(),
    country: json["country"],
    companyName: json["company_name"],
    designation: json["designation"],
  );

  Map<String, dynamic> toJson() => {
    "first_name": firstName?.trim(),
    "last_name": lastName?.trim(),
    "email": email?.trim(),
    "mobile": mobile?.trim(),
    "fcm_token": fcmToken,
    "address_line_1": addressLine1?.trim(),
    "address_line_2": addressLine2?.trim(),
    "city": city?.trim(),
    "state": state?.trim(),
    "postal_code": postalCode?.trim(),
    "lat": lat,
    "long": long,
    "country": country?.trim(),
    "company_name": companyName?.trim(),
    "designation": designation?.trim(),
  };
}
