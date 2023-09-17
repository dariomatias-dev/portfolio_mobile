import 'package:flutter/material.dart';

import 'package:portfolio/src/models/project/project_model.dart';

import 'package:portfolio/src/widgets/project_card_list_view_widget/project_card_widget/project_card_widget.dart';

class ProjectCardListViewWidget extends StatelessWidget {
  const ProjectCardListViewWidget({
    super.key,
    required this.projects,
    required this.screenContext,
  });

  final List<ProjectModel> projects;
  final BuildContext screenContext;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 170.0,
      child: ListView.separated(
        itemCount: projects.length,
        scrollDirection: Axis.horizontal,
        separatorBuilder: (context, index) {
          return const SizedBox(width: 20.0);
        },
        itemBuilder: (context, index) {
          final project = projects[index];
          late final String? projectImageUrl;
          if (project.frontend != null) {
            projectImageUrl = project.frontend?.media[0].url;
          } else if (project.mobile != null) {
            projectImageUrl = project.mobile?.media[0].url;
          } else {
            projectImageUrl = project.backend?.media[0].url;
          }

          return ProjectCardWidget(
            projectName: project.name,
            projectImageUrl: projectImageUrl!,
            screenContext: screenContext,
          );
        },
      ),
    );
  }
}
