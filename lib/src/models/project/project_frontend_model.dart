import 'package:portfolio/src/models/project/project_default_values_model.dart';
import 'package:portfolio/src/models/project/project_media_model.dart';

class ProjectFrontendModel extends ProjectDefaultValuesModel {
  ProjectFrontendModel({
    required description,
    required List<String> details,
    required List<ProjectMediaModel> media,
    required this.demo,
    required String sourceCode,
    required List<String> technologies,
  }) : super(
          description: description,
          details: details,
          media: media,
          technologies: technologies,
          sourceCode: sourceCode,
        );

  final String demo;

  factory ProjectFrontendModel.fromMap(Map<String, dynamic> map) {
    return ProjectFrontendModel(
      description: map['description'],
      details: (map['details'] as List<dynamic>).cast<String>(),
      media: (map['media'] as List<dynamic>).map((value) {
        return ProjectMediaModel.fromMap(value);
      }).toList(),
      demo: map['demo'],
      sourceCode: map['source_code'],
      technologies: (map['technologies'] as List<dynamic>).cast<String>(),
    );
  }

  toMap() {
    return {
      'description': description,
      'details': details,
      'media': media.map((value) {
        return value.toMap();
      }),
      'demo': demo,
      'sourceCode': sourceCode,
      'technologies': technologies,
    };
  }
}
