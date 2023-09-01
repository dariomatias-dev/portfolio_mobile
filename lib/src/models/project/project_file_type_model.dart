class ProjectFileTypeModel {
  ProjectFileTypeModel({
    required this.type,
    required this.url,
  });

  final String type;
  final String url;

  factory ProjectFileTypeModel.fromMap(Map<String, dynamic> map) {
    return ProjectFileTypeModel(
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
