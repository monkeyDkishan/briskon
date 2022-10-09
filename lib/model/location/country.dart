import 'dart:convert';

class ResCountries {

  ResCountries({
    this.countries,
  });

  List<Country>? countries;

  factory ResCountries.fromJson(Map<String, dynamic>? json) => ResCountries(
    countries: List<Country>.from(json?["countries"].map((x) => Country.fromJson(x))),
  );

}

class Country {
  Country({
    this.id,
    this.city,
    this.state,
    this.country,
  });

  String? id;
  String? city;
  String? state;
  String? country;

  factory Country.fromJson(Map<String, dynamic> json) => Country(
    id: json["id"],
    city: json["city"],
    state: json["state"],
    country: json["country"],
  );
}