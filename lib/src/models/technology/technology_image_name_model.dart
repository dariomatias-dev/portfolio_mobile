class TechnologyImageNameModel {
  TechnologyImageNameModel({
    required this.imageStandard,
    this.imageDarkTheme,
  });

  final String imageStandard;
  final String? imageDarkTheme;

  factory TechnologyImageNameModel.fromMap(Map<String, dynamic> map) {
    return TechnologyImageNameModel(
      imageStandard: map['image_standard'],
      imageDarkTheme: map['image_dark_theme'],
    );
  }

  toMap() {
    return {
      'imageStandard': imageStandard,
      'imageDarkTheme': imageDarkTheme,
    };
  }
}
