class HistoricalCharacters {
  final String name;
  final String description;
  final String image;
  final Map wars;

  HistoricalCharacters(
      {required this.name,
      required this.description,
      required this.image,
      required this.wars});

  factory HistoricalCharacters.fromJson(jsonData) {
    return HistoricalCharacters(
      name: jsonData['name'],
      description: jsonData['description'],
      image: jsonData['image'],
      wars: jsonData['wars'],
    );
  }
}
