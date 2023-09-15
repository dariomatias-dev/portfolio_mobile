import 'package:portfolio/src/models/project/project_source_code_model.dart';

class ProjectLinksModel {
  ProjectLinksModel({
    this.demo,
    this.downloadApk,
    required this.sourceCode,
  });

  final String? demo;
  final String? downloadApk;
  final ProjectSourceCodeModel sourceCode;

  factory ProjectLinksModel.fromMap(Map<String, dynamic> map) {
    return ProjectLinksModel(
      demo: map['demo'],
      downloadApk: map['download_apk'],
      sourceCode: ProjectSourceCodeModel.fromMap(map['source_code']),
    );
  }

  toMap() {
    return {
      'demo': demo,
      'downloadApk': downloadApk,
      'sourceCode': sourceCode.toMap(),
    };
  }
}
