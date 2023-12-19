class HistoricalCharacters {
  final String name;
  final String description;
  final String image;

  HistoricalCharacters({
    required this.name,
    required this.description,
    required this.image,
  });

  factory HistoricalCharacters.fromJson(jsonData) {
    return HistoricalCharacters(
      name: jsonData['name'],
      description: jsonData['description'],
      image: jsonData['image'],
    );
  }
}
