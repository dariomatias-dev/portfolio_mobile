class TechnologiesCategoryModel {
  TechnologiesCategoryModel({
    required this.description,
  });

  final String description;

  factory TechnologiesCategoryModel.fromMap(Map<String, dynamic> map) {
    return TechnologiesCategoryModel(
      description: map['description'],
    );
  }

  toMap() {
    return {
      'description': description,
    };
  }
}
