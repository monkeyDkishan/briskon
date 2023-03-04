import 'package:dio/dio.dart';

class ResGetKycDetails {
  ResGetKycDetails({
    this.status,
    this.message,
    this.data,
  });

  int? status;
  String? message;
  KYCData? data;

  factory ResGetKycDetails.fromJson(Map<String, dynamic> json) => ResGetKycDetails(
    status: json["status"],
    message: json["message"],
    data: json["data"] == null ? null : KYCData.fromJson(json["data"]),
  );

  Map<String, dynamic> toJson() => {
    "status": status,
    "message": message,
    "data": data?.toJson(),
  };
}

class KYCData {
  KYCData({
    this.id,
    this.userId,
    this.customerName,
    this.gstNumber,
    this.gstFile,
    this.panNumber,
    this.panFile,
    this.officeAddress,
    this.bankName,
    this.acNumber,
    this.ifscCode,
    this.bankAddress,
    this.createdAt,
    this.updatedAt,
  });

  int? id;
  int? userId;
  String? customerName;
  String? gstNumber;
  String? gstFile;
  String? panNumber;
  String? panFile;
  String? officeAddress;
  String? bankName;
  String? acNumber;
  String? ifscCode;
  String? bankAddress;
  DateTime? createdAt;
  DateTime? updatedAt;

  factory KYCData.fromJson(Map<String, dynamic> json) => KYCData(
    id: json["id"],
    userId: json["user_id"],
    customerName: json["customer_name"],
    gstNumber: json["gst_number"],
    gstFile: json["gst_file"],
    panNumber: json["pan_number"],
    panFile: json["pan_file"],
    officeAddress: json["office_address"],
    bankName: json["bank_name"],
    acNumber: json["ac_number"],
    ifscCode: json["ifsc_code"],
    bankAddress: json["bank_address"],
    createdAt: json["created_at"] == null ? null : DateTime.parse(json["created_at"]),
    updatedAt: json["updated_at"] == null ? null : DateTime.parse(json["updated_at"]),
  );

  Future<Map<String, dynamic>> toJson() async {

    MultipartFile? gstFileMultipart;
    MultipartFile? panFileMultipart;

    if(gstFile != null) {
      gstFileMultipart = await MultipartFile.fromFile(gstFile!);
    }

    if(panFile != null) {
      panFileMultipart = await MultipartFile.fromFile(panFile!);
    }

    return {
      "user_id": userId,
      "customer_name": customerName,
      "gst_number": gstNumber,
      "gst_file": gstFileMultipart,
      "pan_number": panNumber,
      "pan_file": panFileMultipart,
      "office_address": officeAddress,
      "bank_name": bankName,
      "ac_number": acNumber,
      "ifsc_code": ifscCode,
      "bank_address": bankAddress,
    };
  }
}
