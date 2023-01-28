class ResGetProductList {
  ResGetProductList({
    this.status,
    this.message,
    this.data,
  });

  int? status;
  String? message;
  Data? data;

  factory ResGetProductList.fromJson(Map<String, dynamic> json) => ResGetProductList(
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
    this.list,
  });

  List<ListElement>? list;

  ListElement? get primaryProduct => list?.firstWhere((element) => element.isPrimary == 1);

  factory Data.fromJson(Map<String, dynamic> json) => Data(
    list: json["list"] == null ? [] : List<ListElement>.from(json["list"]!.map((x) => ListElement.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "list": list == null ? [] : List<dynamic>.from(list!.map((x) => x.toJson())),
  };
}

class ListElement {
  ListElement({
    this.id,
    this.value,
    this.priceDifference,
    this.isPrimary,
  });

  int? id;
  String? value;
  String? priceDifference;
  int? isPrimary;
  String amount = "";

  String get productName => "${value ?? ""} mm";

  factory ListElement.fromJson(Map<String, dynamic> json) => ListElement(
    id: json["id"],
    value: json["value"],
    priceDifference: json["price_difference"],
    isPrimary: json["is_primary"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "value": value,
    "price_difference": priceDifference,
    "is_primary": isPrimary,
  };
}
