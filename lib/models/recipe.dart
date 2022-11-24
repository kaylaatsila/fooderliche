class Recipe {
  final String uri;
  final String label;
  Recipe(this.uri, this.label);

  Recipe.fromJson(Map<String, dynamic> json)
      : uri = json['uri'],
        label = json['label'];
  Map<String, dynamic> toJson() => {
        'uri': uri,
        'label': label,
      };
}
