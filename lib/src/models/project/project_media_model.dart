class ProjectMediaModel {
  ProjectMediaModel({
    required this.type,
    required this.url,
  });

  final String type;
  final String url;

  factory ProjectMediaModel.fromMap(Map<String, dynamic> map) {
    return ProjectMediaModel(
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
