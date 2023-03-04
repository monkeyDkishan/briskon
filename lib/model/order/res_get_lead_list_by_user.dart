
import 'package:briskon/utils.dart';

class ResGetLeadListByUser {
  ResGetLeadListByUser({
    this.status,
    this.message,
    this.data,
  });

  int? status;
  String? message;
  List<Datum>? data;

  factory ResGetLeadListByUser.fromJson(Map<String, dynamic> json) => ResGetLeadListByUser(
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
  Datum({
    this.id,
    this.orderDate,
    this.dueDate,
    this.finalTotal,
    this.orderCode,
    this.totalTons,
    this.status,
  });

  int? id;
  DateTime? orderDate;
  dynamic dueDate;
  String? finalTotal;
  String? orderCode;
  String? totalTons;
  OrderStatus? status;

  factory Datum.fromJson(Map<String, dynamic> json) => Datum(
    id: json["id"],
    orderDate: json["order_date"] == null ? null : DateTime.parse(json["order_date"]),
    orderCode: json["order_code"],
    dueDate: json["due_date"],
    finalTotal: json["final_total"],
    totalTons: json["total_tons"],
    status: statusValues.map[json["status"]]!,
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "order_date": "${orderDate!.year.toString().padLeft(4, '0')}-${orderDate!.month.toString().padLeft(2, '0')}-${orderDate!.day.toString().padLeft(2, '0')}",
    "due_date": dueDate,
    "final_total": finalTotal,
    "total_tons": totalTons,
    "status": statusValues.reverse[status],
  };
}

enum OrderStatus { PENDING, COMPLETED, CONFIRMED, REJECTED }

final statusValues = EnumValues({
  "pending": OrderStatus.PENDING,
  "completed": OrderStatus.COMPLETED,
  "confirmed": OrderStatus.CONFIRMED,
  "rejected": OrderStatus.REJECTED,
});

