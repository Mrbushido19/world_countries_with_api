import 'package:world_countries_with_resp_api/core/classes/ron_class.dart';

class NativeName {
  final Ron? ron;

  NativeName({
    this.ron,
  });

  factory NativeName.fromJson(Map<String, dynamic> json) => NativeName(
        ron: json["ron"] == null ? null : Ron.fromJson(json["ron"]),
      );

  Map<String, dynamic> toJson() => {
        "ron": ron?.toJson(),
      };
}
