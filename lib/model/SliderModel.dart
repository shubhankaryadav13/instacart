class SliderModel {
  final String Title;
  final String Subtitle;
  final String ImagePath;

  SliderModel({
    required this.Title,
    required this.Subtitle,
    required this.ImagePath,
  });

  factory SliderModel.fromMap(Map<String, dynamic> data) {
    return SliderModel(
      Title: data['Title'] ?? '',
      Subtitle: data['Subtitle'] ?? '',
      ImagePath: data['ImagePath'] ?? '',
    );
  }
}
