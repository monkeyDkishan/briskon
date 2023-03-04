part of utils;

enum Status { loading, completed, error, unAuthorised }

enum DocumentTypes {
  banner,
  certificate,
  application,
  productQuality,
  brochure,
}

final documentTypes = EnumValues({
  "banner": DocumentTypes.banner,
  "certificate": DocumentTypes.certificate,
  "application": DocumentTypes.application,
  "product_quality": DocumentTypes.productQuality,
  "brochure": DocumentTypes.brochure,
});

extension DocumentTypesExt on DocumentTypes {

  String? get textValue {
    return documentTypes.reverse[this];
  }

}

class EnumValues<T> {
  Map<String, T> map;
  late Map<T, String> reverseMap;

  EnumValues(this.map);

  Map<T, String> get reverse {
    reverseMap = map.map((k, v) => MapEntry(v, k));
    return reverseMap;
  }
}