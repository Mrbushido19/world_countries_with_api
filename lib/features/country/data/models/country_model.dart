// To parse this JSON data, do
//
//     final countryModel = countryModelFromJson(jsonString);

import 'dart:convert';

import 'package:world_countries_with_resp_api/core/classes/flags_class.dart';
import 'package:world_countries_with_resp_api/core/classes/languages_class.dart';
import 'package:world_countries_with_resp_api/core/classes/name_class.dart';
import 'package:world_countries_with_resp_api/features/country/domain/entities/country.dart';

List<CountryModel> countryModelFromJson(String str) => List<CountryModel>.from(
    json.decode(str).map((x) => CountryModel.fromJson(x)));

String countryModelToJson(List<CountryModel> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class CountryModel {
  final Name? name;
  final List<String>? capital;
  final Languages? languages;
  final int? population;
  final List<String>? timezones;
  final List<String>? continents;
  final Flags? flags;

  CountryModel({
    this.name,
    this.capital,
    this.languages,
    this.population,
    this.timezones,
    this.continents,
    this.flags,
  });

  factory CountryModel.fromEntity(Country country) {
    return CountryModel(
        name: country.name,
        capital: country.capital,
        languages: country.languages,
        population: country.population,
        timezones: country.timezones,
        continents: country.continents,
        flags: country.flags);
  }
  Country toEntity() {
    return Country(
        name: name,
        capital: capital,
        languages: languages,
        population: population,
        timezones: timezones,
        continents: continents,
        flags: flags);
  }

  factory CountryModel.fromJson(Map<String, dynamic> json) => CountryModel(
        name: json["name"] == null ? null : Name.fromJson(json["name"]),
        capital: json["capital"] == null
            ? []
            : List<String>.from(json["capital"]!.map((x) => x)),
        languages: json["languages"] == null
            ? null
            : Languages.fromJson(json["languages"]),
        population: json["population"],
        timezones: json["timezones"] == null
            ? []
            : List<String>.from(json["timezones"]!.map((x) => x)),
        continents: json["continents"] == null
            ? []
            : List<String>.from(json["continents"]!.map((x) => x)),
        flags: json["flags"] == null ? null : Flags.fromJson(json["flags"]),
      );

  Map<String, dynamic> toJson() => {
        "name": name?.toJson(),
        "capital":
            capital == null ? [] : List<dynamic>.from(capital!.map((x) => x)),
        "languages": languages?.toJson(),
        "population": population,
        "timezones": timezones == null
            ? []
            : List<dynamic>.from(timezones!.map((x) => x)),
        "continents": continents == null
            ? []
            : List<dynamic>.from(continents!.map((x) => x)),
        "flags": flags?.toJson(),
      };
}
