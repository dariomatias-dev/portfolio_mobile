import 'package:flutter/material.dart';

import 'package:portfolio/src/models/project/project_model.dart';

import 'package:portfolio/src/providers/data_provider_inherited_widget.dart';
import 'package:portfolio/src/screens/project_screen/project_body_content_widget.dart';

class ProjectScreen extends StatefulWidget {
  const ProjectScreen({
    super.key,
    required this.projectName,
  });

  final String projectName;

  @override
  State<ProjectScreen> createState() => _ProjectScreenState();
}

class _ProjectScreenState extends State<ProjectScreen> {
  ProjectModel? setProject(String projectName) {
    final projects = DataProviderInheritedWidget.of(context)?.projects;
    final project = projects?.firstWhere((item) {
      return item.name == projectName;
    });

    return project;
  }

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final project = setProject(widget.projectName);

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: Text(
          project?.name ?? '',
          style: const TextStyle(
            color: Colors.white,
          ),
        ),
        leading: GestureDetector(
          onTap: () {
            Navigator.pop(context);
          },
          child: const Tooltip(
            message: 'Sair',
            child: Icon(
              Icons.arrow_back_ios_new_rounded,
              color: Colors.white,
            ),
          ),
        ),
      ),
      body: project != null
          ? ProjectBodyContentWidget(
              project: project,
            )
          : const Center(
              child: Text(
                'Não foi possível carregar os dados do projeto',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 14,
                  fontWeight: FontWeight.w700,
                ),
              ),
            ),
    );
  }
}
