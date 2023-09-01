import 'package:portfolio/src/models/project/project_file_type_model.dart';
import 'package:portfolio/src/models/project/project_links_model.dart';

class ProjectModel {
  ProjectModel({
    required this.name,
    required this.files,
    required this.links,
    required this.technologies,
  });

  final String name;
  final List<ProjectFileTypeModel> files;
  final ProjectLinksModel links;
  final List<String> technologies;

  factory ProjectModel.fromMap(Map<String, dynamic> map) {
    return ProjectModel(
      name: map['name'],
      files: ((map['files'] as List<dynamic>).cast<Map<String, dynamic>>()).map((file) {
        return ProjectFileTypeModel.fromMap(file);
      }).toList(),
      links: ProjectLinksModel.fromMap(map['links']),
      technologies: (map['technologies'] as List<dynamic>).cast<String>(),
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
