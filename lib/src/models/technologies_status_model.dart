class TechnologieStatusModel {
  TechnologieStatusModel({
    required this.description,
    required this.technologies,
  });

  final String description;
  final List<String> technologies;

  factory TechnologieStatusModel.fromMap(Map<String, dynamic> map) {
    return TechnologieStatusModel(
      description: map['description'],
      technologies: (map['technologies'] as List<dynamic>).cast<String>(),
    );
  }

  toMap() {
    return {
      'description': description,
      'technologies': technologies,
    };
  }
}
