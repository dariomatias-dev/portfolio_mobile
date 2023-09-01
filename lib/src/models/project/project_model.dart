import 'package:portfolio/src/models/project/project_links_model.dart';

class ProjectModel {
  ProjectModel({
    required this.name,
    required this.technologies,
    required this.links,
  });

  final String name;
  final List<String> technologies;
  final ProjectLinksModel links;

  factory ProjectModel.fromMap(Map<String, dynamic> map) {
    return ProjectModel(
      name: map['name'],
      technologies: map['technologies'],
      links: ProjectLinksModel.fromMap(map['links']),
    );
  }

  toMap() {
    return {
      'name': name,
      'technologies': technologies,
      'links': links.toMap(),
    };
  }
}
