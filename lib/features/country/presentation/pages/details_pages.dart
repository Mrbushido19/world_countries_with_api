

import 'package:flutter/material.dart';

import 'package:world_countries_with_resp_api/core/classes/flags_class.dart';
import 'package:world_countries_with_resp_api/core/classes/languages_class.dart';
import 'package:world_countries_with_resp_api/core/classes/name_class.dart';

class DetailsPage extends StatelessWidget {
  final Name? name;
  final List<String>? capital;
  final Languages? languages;
  final int? population;
  final List<String>? timeZones;
  final List<String>? continents;
  final Flags? flags;
  const DetailsPage({
    Key? key,
    required this.name,
    required this.capital,
    required this.languages,
    required this.population,
    required this.timeZones,
    required this.continents,
    required this.flags,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(name!.common ?? "untitled"),
      ),
    );
  }
}
