import 'package:flutter/material.dart';

import 'package:portfolio/src/core/ui/helpers/open_url.dart';

import 'package:portfolio/src/providers/project_data_provider_inherited_widget.dart';

import 'package:portfolio/src/screens/project_screen/project_body_content_widget/project_infos_widget/project_infos_details_widget.dart';
import 'package:portfolio/src/screens/project_screen/project_body_content_widget/project_infos_widget/project_infos_source_code_widget.dart';
import 'package:portfolio/src/screens/project_screen/project_body_content_widget/project_infos_widget/project_infos_technologies_widget.dart';

class ProjectInfosWidget extends StatelessWidget {
  const ProjectInfosWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final project = ProjectDataProviderInheritedWidget.of(context)!.project;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              project.name,
              style: const TextStyle(
                color: Colors.white,
                fontSize: 18.0,
                fontWeight: FontWeight.w700,
              ),
            ),
            if (project.links.demo != null)
              IconButton(
                onPressed: () {
                  OpenUrl(
                    context: context,
                  ).launch(project.links.demo!);
                },
                icon: const Icon(
                  Icons.visibility_outlined,
                  color: Colors.white54,
                  size: 28.0,
                ),
              ),
          ],
        ),
        const SizedBox(height: 10.0),
        Text(
          project.description,
          textAlign: TextAlign.justify,
          style: const TextStyle(
            color: Colors.white,
          ),
        ),
        const SizedBox(height: 6.0),
        ProjectInfosDetailsWidget(
          details: project.details,
        ),
        const SizedBox(height: 20.0),
        ProjectInfosTechnologiesWidget(
          technologies: project.technologies,
        ),
        const SizedBox(height: 10.0),
        const Divider(),
        const SizedBox(height: 10.0),
        ProjectInfosSourceCodeWidget(
          sourceCode: project.links.sourceCode,
        ),
      ],
    );
  }
}
