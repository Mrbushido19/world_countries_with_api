class Languages {
  final String? ron;

  Languages({
    this.ron,
  });

  factory Languages.fromJson(Map<String, dynamic> json) => Languages(
        ron: json["ron"],
      );

  Map<String, dynamic> toJson() => {
        "ron": ron,
      };
}
