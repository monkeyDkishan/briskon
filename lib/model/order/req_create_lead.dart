// To parse this JSON data, do
//
//     final reqCreateLead = reqCreateLeadFromJson(jsonString);

import 'dart:convert';

ReqCreateLead reqCreateLeadFromJson(String str) => ReqCreateLead.fromJson(json.decode(str));

String reqCreateLeadToJson(ReqCreateLead data) => json.encode(data.toJson());

class ReqCreateLead {
  ReqCreateLead({
    this.userId,
    this.deliveryAddress,
    this.billingAddress,
    this.note,
    this.primaryProductPricePerTon,
    this.leadProducts,
  });

  String? userId;
  String? deliveryAddress;
  String? note;
  String? billingAddress;
  double? primaryProductPricePerTon;
  List<LeadProduct>? leadProducts;

  factory ReqCreateLead.fromJson(Map<String, dynamic> json) => ReqCreateLead(
    userId: json["user_id"],
    deliveryAddress: json["delivery_address"],
    note: json["note"],
    billingAddress: json["billing_address"],
    primaryProductPricePerTon: json["primary_product_price_per_ton"],
    leadProducts: json["lead_products"] == null ? [] : List<LeadProduct>.from(json["lead_products"]!.map((x) => LeadProduct.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "user_id": userId,
    "delivery_address": deliveryAddress,
    "note": note,
    "billing_address": billingAddress,
    "primary_product_price_per_ton": primaryProductPricePerTon,
    "lead_products": leadProducts == null ? [] : List<dynamic>.from(leadProducts!.map((x) => x.toJson())),
  };
}

class LeadProduct {
  LeadProduct({
    this.productId,
    this.quantity,
  });

  int? productId;
  int? quantity;
  String? productName;

  factory LeadProduct.fromJson(Map<String, dynamic> json) => LeadProduct(
    productId: json["product_id"],
    quantity: json["qty"],
  );

  Map<String, dynamic> toJson() => {
    "product_id": productId,
    "qty": quantity,
  };
}
