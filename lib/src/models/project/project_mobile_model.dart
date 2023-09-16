import 'package:portfolio/src/models/project/project_default_values_model.dart';
import 'package:portfolio/src/models/project/project_media_model.dart';

class ProjectMobileModel extends ProjectDefaultValuesModel {
  ProjectMobileModel({
    required description,
    required List<String> details,
    required List<ProjectMediaModel> media,
    required this.downloadApk,
    required String sourceCode,
    required List<String> technologies,
  }) : super(
          description: description,
          details: details,
          media: media,
          technologies: technologies,
          sourceCode: sourceCode,
        );

  final String downloadApk;

  factory ProjectMobileModel.fromMap(Map<String, dynamic> map) {
    return ProjectMobileModel(
      description: map['description'],
      details: (map['details'] as List<dynamic>).cast<String>(),
      media: (map['media'] as List<dynamic>).map((value) {
        return ProjectMediaModel.fromMap(value);
      }).toList(),
      downloadApk: map['download_apk'],
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
      'downloadApk': downloadApk,
      'sourceCode': sourceCode,
      'technologies': technologies,
    };
  }
}
