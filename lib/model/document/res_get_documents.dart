
class ResGetDocuments {
  ResGetDocuments({
    this.status,
    this.message,
    this.data,
  });

  int? status;
  String? message;
  List<Datum>? data;

  factory ResGetDocuments.fromJson(Map<String, dynamic> json) => ResGetDocuments(
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
    this.type,
    this.path,
    this.fileType,
    this.title,
  });

  int? id;
  String? type;
  String? path;
  String? fileType;
  String? title;

  factory Datum.fromJson(Map<String, dynamic> json) => Datum(
    id: json["id"],
    type: json["type"],
    path: json["path"],
    fileType: json["file_type"],
    title: json["title"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "type": type,
    "path": path,
    "file_type": fileType,
    "title": title,
  };
}
