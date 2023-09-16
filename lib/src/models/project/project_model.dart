import 'package:portfolio/src/models/project/project_backend_model.dart';
import 'package:portfolio/src/models/project/project_frontend_model.dart';
import 'package:portfolio/src/models/project/project_mobile_model.dart';

class ProjectModel {
  ProjectModel({
    required this.name,
    required this.frontend,
    required this.backend,
    required this.mobile,
  });

  final String name;
  final ProjectFrontendModel? frontend;
  final ProjectBackendModel? backend;
  final ProjectMobileModel? mobile;

  factory ProjectModel.fromMap(Map<String, dynamic> map) {
    return ProjectModel(
      name: map['name'],
      frontend: ProjectFrontendModel.fromMap(map['frontend']),
      backend: ProjectBackendModel.fromMap(map['backend']),
      mobile: ProjectMobileModel.fromMap(map['mobile']),
    );
  }

  toMap() {
    return {
      'name': name,
      'frontend': frontend?.toMap(),
      'backend': backend?.toMap(),
      'mobile': mobile?.toMap(),
    };
  }
}
