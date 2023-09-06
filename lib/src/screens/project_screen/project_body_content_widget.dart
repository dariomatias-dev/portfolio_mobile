import 'package:flutter/material.dart';
import 'package:portfolio/src/models/project/project_model.dart';

class ProjectBodyContentWidget extends StatelessWidget {
  const ProjectBodyContentWidget({
    super.key,
    required this.project,
  });

  final ProjectModel project;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(
        project.name,
        style: const TextStyle(
          color: Colors.white,
        ),
      ),
    );
  }
}
