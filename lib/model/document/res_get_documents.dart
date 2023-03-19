
import 'package:briskon/services/server_config.dart';

class ResGetDocuments {
  ResGetDocuments({
    this.status,
    this.message,
    this.data,
  });

  int? status;
  String? message;
  List<Documents>? data;

  factory ResGetDocuments.fromJson(Map<String, dynamic> json) => ResGetDocuments(
    status: json["status"],
    message: json["message"],
    data: json["data"] == null ? [] : List<Documents>.from(json["data"]!.map((x) => Documents.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "status": status,
    "message": message,
    "data": data == null ? [] : List<dynamic>.from(data!.map((x) => x.toJson())),
  };
}

class Documents {
  Documents({
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

  String get imageURL => "${ServerConfig.imageBaseURL}/$path";

  factory Documents.fromJson(Map<String, dynamic> json) => Documents(
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
