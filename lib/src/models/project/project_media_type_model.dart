class ProjectMediaTypeModel {
  ProjectMediaTypeModel({
    required this.type,
    required this.url,
  });

  final String type;
  final String url;

  factory ProjectMediaTypeModel.fromMap(Map<String, dynamic> map) {
    return ProjectMediaTypeModel(
      type: map['type'],
      url: map['url'],
    );
  }

  toMap() {
    return {
      'type': type,
      'url': url,
    };
  }
}
