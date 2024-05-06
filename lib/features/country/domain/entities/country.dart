// ignore_for_file: public_member_api_docs, sort_constructors_first

import 'package:world_countries_with_resp_api/core/classes/flags_class.dart';
import 'package:world_countries_with_resp_api/core/classes/languages_class.dart';
import 'package:world_countries_with_resp_api/core/classes/name_class.dart';

class Country {
  final Name? name;
  final List<String>? capital;
  final Languages? languages;
  final int? population;
  final List<String>? timezones;
  final List<String>? continents;
  final Flags? flags;

  Country(
      {required this.name,
      required this.capital,
      required this.languages,
      required this.population,
      required this.timezones,
      required this.continents,
      required this.flags});
}
