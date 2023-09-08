import 'package:flutter/material.dart';

import 'package:portfolio/src/models/project/project_model.dart';

import 'package:portfolio/src/providers/data_provider_inherited_widget.dart';
import 'package:portfolio/src/providers/project_data_provider_inherited_widget.dart';

import 'package:portfolio/src/screens/project_screen/project_body_content_widget/project_body_content_widget.dart';

import 'package:portfolio/src/widgets/screen_header_template_widget.dart';

class ProjectScreen extends StatelessWidget {
  const ProjectScreen({
    super.key,
    required this.projectName,
  });

  final String projectName;

  ProjectModel? setProject(BuildContext context) {
    final projects = DataProviderInheritedWidget.of(context)?.projects;
    final project = projects?.firstWhere((item) {
      return item.name == projectName;
    });

    return project;
  }

  @override
  Widget build(BuildContext context) {
    final project = setProject(context);

    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: project != null
              ? ProjectDataProviderInheritedWidget(
                  screenContext: context,
                  project: project,
                  child: const ProjectBodyContentWidget(),
                )
              : Stack(
                  children: [
                    SizedBox(
                      height: MediaQuery.sizeOf(context).height,
                      child: const Center(
                        child: Text(
                          'Não foi possível carregar os dados do projeto',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 14,
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                      ),
                    ),
                    ScreenHeaderTemplateWidget(
                      screenContext: context,
                    ),
                  ],
                ),
        ),
      ),
    );
  }
}
