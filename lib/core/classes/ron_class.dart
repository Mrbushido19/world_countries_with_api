
class Ron {
    final String? official;
    final String? common;

    Ron({
        this.official,
        this.common,
    });

    factory Ron.fromJson(Map<String, dynamic> json) => Ron(
        official: json["official"],
        common: json["common"],
    );

    Map<String, dynamic> toJson() => {
        "official": official,
        "common": common,
    };
}