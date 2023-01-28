
import 'package:dio/dio.dart';

class ReqUpdateUser {
  ReqUpdateUser({
    this.userId,
    this.firstName,
    this.lastName,
    this.email,
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
    this.profilePic,
  });

  String? userId;
  String? firstName;
  String? lastName;
  String? email;
  String? addressLine1;
  String? addressLine2;
  String? city;
  String? state;
  String? postalCode;
  String? lat;
  String? long;
  String? country;
  String? companyName;
  String? designation;
  String? profilePic;

  Future<Map<String, dynamic>> toJson() async {

    MultipartFile? multipartFile;

    if(profilePic != null) {
      multipartFile = await MultipartFile.fromFile(profilePic!);
    }

    return {
      "user_id": userId,
      "first_name": firstName,
      "last_name": lastName,
      "email": email,
      "address_line_1": addressLine1,
      "address_line_2": addressLine2,
      "city": city,
      "state": state,
      "postal_code": postalCode,
      "lat": lat,
      "long": long,
      "country": country,
      "company_name": companyName,
      "designation": designation,
      "profile_pic": multipartFile
    };
  }
}
