
import 'package:briskon/model/order/res_get_lead_list_by_user.dart';

class ResGetLeadDetailByLeadId {
  ResGetLeadDetailByLeadId({
    this.status,
    this.message,
    this.data,
  });

  int? status;
  String? message;
  Data? data;

  factory ResGetLeadDetailByLeadId.fromJson(Map<String, dynamic> json) => ResGetLeadDetailByLeadId(
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
    this.userId,
    this.pickupAddress,
    this.deliveryAddress,
    this.billingAddress,
    this.note,
    this.totalTons,
    this.orderCode,
    this.orderDate,
    this.dueDate,
    this.primaryProductPrice,
    this.status,
    this.total,
    this.finalTotal,
    this.createdAt,
    this.updatedAt,
    this.product,
  });

  int? id;
  int? userId;
  String? pickupAddress;
  String? deliveryAddress;
  String? billingAddress;
  String? note;
  String? totalTons;
  String? orderCode;
  DateTime? orderDate;
  DateTime? dueDate;
  String? primaryProductPrice;
  OrderStatus? status;
  String? total;
  String? finalTotal;
  DateTime? createdAt;
  DateTime? updatedAt;
  List<Product>? product;

  factory Data.fromJson(Map<String, dynamic> json) => Data(
    id: json["id"],
    userId: json["user_id"],
    pickupAddress: json["pickup_address"],
    deliveryAddress: json["delivery_address"],
    billingAddress: json["billing_address"],
    note: json["note"],
    totalTons: json["total_tons"],
    orderCode: json["order_code"],
    orderDate: json["order_date"] == null ? null : DateTime.parse(json["order_date"]),
    dueDate: json["due_date"] == null ? null : DateTime.parse(json["due_date"]),
    primaryProductPrice: json["primary_product_price"],
    status: statusValues.map[json["status"]]!,
    total: json["total"],
    finalTotal: json["final_total"],
    createdAt: json["created_at"] == null ? null : DateTime.parse(json["created_at"]),
    updatedAt: json["updated_at"] == null ? null : DateTime.parse(json["updated_at"]),
    product: json["product"] == null ? [] : List<Product>.from(json["product"]!.map((x) => Product.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "user_id": userId,
    "pickup_address": pickupAddress,
    "delivery_address": deliveryAddress,
    "billing_address": billingAddress,
    "note": note,
    "total_tons": totalTons,
    "order_code": orderCode,
    "order_date": "${orderDate!.year.toString().padLeft(4, '0')}-${orderDate!.month.toString().padLeft(2, '0')}-${orderDate!.day.toString().padLeft(2, '0')}",
    "due_date": "${dueDate!.year.toString().padLeft(4, '0')}-${dueDate!.month.toString().padLeft(2, '0')}-${dueDate!.day.toString().padLeft(2, '0')}",
    "primary_product_price": primaryProductPrice,
    "status": status,
    "total": total,
    "final_total": finalTotal,
    "created_at": createdAt?.toIso8601String(),
    "updated_at": updatedAt?.toIso8601String(),
    "product": product == null ? [] : List<dynamic>.from(product!.map((x) => x.toJson())),
  };
}

class Product {
  Product({
    this.id,
    this.leadId,
    this.productId,
    this.qty,
    this.price,
    this.type,
    this.value,
    this.createdAt,
    this.updatedAt,
  });

  int? id;
  int? leadId;
  int? productId;
  String? qty;
  String? price;
  String? type;
  dynamic value;
  DateTime? createdAt;
  DateTime? updatedAt;

  factory Product.fromJson(Map<String, dynamic> json) => Product(
    id: json["id"],
    leadId: json["lead_id"],
    productId: json["product_id"],
    qty: json["qty"],
    price: json["price"],
    type: json["type"],
    value: json["value"],
    createdAt: json["created_at"] == null ? null : DateTime.parse(json["created_at"]),
    updatedAt: json["updated_at"] == null ? null : DateTime.parse(json["updated_at"]),
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "lead_id": leadId,
    "product_id": productId,
    "qty": qty,
    "price": price,
    "type": type,
    "value": value,
    "created_at": createdAt?.toIso8601String(),
    "updated_at": updatedAt?.toIso8601String(),
  };
}
