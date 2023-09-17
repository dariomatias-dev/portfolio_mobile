import 'package:flutter/material.dart';

import 'package:portfolio/src/providers/project_data_provider_inherited_widget.dart';

import 'package:portfolio/src/screens/project_screen/project_body_content_widget/project_infos_widget/project_infos_details_widget.dart';

class ProjectInfosWidget extends StatelessWidget {
  const ProjectInfosWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final project = ProjectDataProviderInheritedWidget.of(context)!.project;
    final developmentArea =
        ProjectDataProviderInheritedWidget.of(context)!.developmentArea;
    late final String projectDescription;
    late final List<String> projectDetails;

    if (developmentArea == 'frontend') {
      projectDescription = project.frontend!.description;
      projectDetails = project.frontend!.details;
    } else if (developmentArea == 'backend') {
      projectDescription = project.backend!.description;
      projectDetails = project.backend!.details;
    } else {
      projectDescription = project.mobile!.description;
      projectDetails = project.mobile!.details;
    }

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              project.name,
              style: const TextStyle(
                fontSize: 18.0,
                fontWeight: FontWeight.w700,
              ),
            ),
          ],
        ),
        const SizedBox(height: 10.0),
        Text(
          projectDescription,
          textAlign: TextAlign.justify,
        ),
        const SizedBox(height: 6.0),
        ProjectInfosDetailsWidget(
          details: projectDetails,
        ),
      ],
    );
  }
}
