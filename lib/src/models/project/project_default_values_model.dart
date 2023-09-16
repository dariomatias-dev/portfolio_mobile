import 'package:portfolio/src/models/project/project_media_model.dart';

abstract class ProjectDefaultValuesModel {
  ProjectDefaultValuesModel({
    required this.description,
    required this.details,
    required this.media,
    required this.sourceCode,
    required this.technologies,
  });

  final String description;
  final List<String> details;
  final List<ProjectMediaModel> media;
  final String sourceCode;
  final List<String> technologies;
}
