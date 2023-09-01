import 'package:portfolio/src/models/project/project_source_code_model.dart';

class ProjectLinksModel {
  ProjectLinksModel({
    this.demo,
    required this.sourceCode,
  });

  final String? demo;
  final ProjectSourceCodeModel sourceCode;

  factory ProjectLinksModel.fromMap(Map<String, dynamic> map) {
    return ProjectLinksModel(
      demo: map['demo'],
      sourceCode: ProjectSourceCodeModel.fromMap(map['sourceCode']),
    );
  }

  toMap() {
    return {
      'demo': demo,
      'sourceCode': sourceCode.toMap(),
    };
  }
}
