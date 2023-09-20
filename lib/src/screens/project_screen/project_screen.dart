import 'package:flutter/material.dart';

import 'package:portfolio/src/core/ui/widgets/error_message_loading_data_widget.dart';

import 'package:portfolio/src/models/project/project_model.dart';

import 'package:portfolio/src/providers/data_provider_inherited_widget.dart';
import 'package:portfolio/src/providers/project_data_provider_inherited_widget.dart';

import 'package:portfolio/src/screens/project_screen/components/project_body_content_widget/project_body_content_widget.dart';
import 'package:portfolio/src/screens/project_screen/components/project_screen_header_widget.dart';

class ProjectScreen extends StatelessWidget {
  const ProjectScreen({
    super.key,
    required this.projectName,
    required this.developmentArea,
  });

  final String projectName;
  final String developmentArea;

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
                  developmentArea: developmentArea,
                  child: const Stack(
                    children: [
                      ProjectBodyContentWidget(),
                      ProjectScreenHeaderWidget(),
                    ],
                  ),
                )
              : ErrorMessageLoadingDataWidget(
                  messageVariation: 'do projeto',
                  screenContext: context,
                ),
        ),
      ),
    );
  }
}
