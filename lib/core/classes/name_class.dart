import 'package:world_countries_with_resp_api/core/classes/native_name_class.dart';

class Name {
  final String? common;
  final String? official;
  final NativeName? nativeName;

  Name({
    this.common,
    this.official,
    this.nativeName,
  });

  factory Name.fromJson(Map<String, dynamic> json) => Name(
        common: json["common"],
        official: json["official"],
        nativeName: json["nativeName"] == null
            ? null
            : NativeName.fromJson(json["nativeName"]),
      );

  Map<String, dynamic> toJson() => {
        "common": common,
        "official": official,
        "nativeName": nativeName?.toJson(),
      };
}
