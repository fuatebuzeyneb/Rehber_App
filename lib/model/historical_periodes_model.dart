class HistoricalPeriodsModel {
  final String name;
  final String description;
  final String image;
  final Map wars;

  HistoricalPeriodsModel(
      {required this.name,
      required this.description,
      required this.image,
      required this.wars});

  factory HistoricalPeriodsModel.fromJson(jsonData) {
    return HistoricalPeriodsModel(
      name: jsonData['name'],
      description: jsonData['description'],
      image: jsonData['image'],
      wars: jsonData['wars'],
    );
  }
}
