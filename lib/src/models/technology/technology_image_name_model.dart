class TechnologieImageNameModel {
  TechnologieImageNameModel({
    required this.imageStandard,
    this.imageDarkTheme,
  });

  final String imageStandard;
  final String? imageDarkTheme;

  factory TechnologieImageNameModel.fromMap(Map<String, dynamic> map) {
    return TechnologieImageNameModel(
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
