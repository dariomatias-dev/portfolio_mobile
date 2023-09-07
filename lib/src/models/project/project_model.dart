import 'package:portfolio/src/models/project/project_media_model.dart';
import 'package:portfolio/src/models/project/project_links_model.dart';

class ProjectModel {
  ProjectModel({
    required this.name,
    required this.description,
    required this.media,
    required this.technologies,
    required this.links,
  });

  final String name;
  final String description;
  final List<ProjectMediaModel> media;
  final List<String> technologies;
  final ProjectLinksModel links;

  factory ProjectModel.fromMap(Map<String, dynamic> map) {
    return ProjectModel(
      name: map['name'],
      description: map['description'],
      media: ((map['media'] as List<dynamic>).cast<Map<String, dynamic>>()).map(
        (file) {
          return ProjectMediaModel.fromMap(file);
        },
      ).toList(),
      technologies: (map['technologies'] as List<dynamic>).cast<String>(),
      links: ProjectLinksModel.fromMap(map['links']),
    );
  }

  toMap() {
    return {
      'name': name,
      'description': description,
      'media': media.map((file) {
        return file.toMap();
      }),
      'technologies': technologies,
      'links': links.toMap(),
    };
  }
}
