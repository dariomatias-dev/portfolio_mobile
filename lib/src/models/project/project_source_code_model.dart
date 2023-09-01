class ProjectSourceCodeModel {
  ProjectSourceCodeModel({
    this.frontend,
    this.backend,
    this.mobile,
  });

  final String? frontend;
  final String? backend;
  final String? mobile;

  factory ProjectSourceCodeModel.fromMap(Map<String, dynamic> map) {
    return ProjectSourceCodeModel(
      frontend: map['frontend'],
      backend: map['backend'],
      mobile: map['mobile'],
    );
  }

  toMap() {
    return {
      'frontend': frontend,
      'backend': backend,
      'mobile': mobile,
    };
  }
}
