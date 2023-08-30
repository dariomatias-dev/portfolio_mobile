class TechnologyNameModel {
  TechnologyNameModel({
    required this.name,
  });

  final String name;

  factory TechnologyNameModel.fromMap(Map<String, dynamic> map) {
    return TechnologyNameModel(
      name: map['name'],
    );
  }

  toMap() {
    return {
      'name': name,
    };
  }
}
