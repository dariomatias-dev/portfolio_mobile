class TechnologieStatusModel {
  TechnologieStatusModel({
    required this.description,
  });

  final String description;

  factory TechnologieStatusModel.fromMap(Map<String, dynamic> map) {
    return TechnologieStatusModel(
      description: map['description'],
    );
  }

  toMap() {
    return {
      'description': description,
    };
  }
}
