import 'package:flutter/material.dart';

import 'package:portfolio/src/core/ui/helpers/open_url.dart';

import 'package:portfolio/src/providers/project_data_provider_inherited_widget.dart';

import 'package:portfolio/src/screens/project_screen/project_body_content_widget/project_details_widget/project_details_source_code_widget.dart';
import 'package:portfolio/src/screens/project_screen/project_body_content_widget/project_details_widget/project_details_technologies_widget.dart';

class ProjectDetailsWidget extends StatelessWidget {
  const ProjectDetailsWidget({super.key});

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
            if (project.links.demo != null) ...[
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
          ],
        ),
        const SizedBox(height: 10.0),
        const Text(
          "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book.",
          textAlign: TextAlign.justify,
          style: TextStyle(
            color: Colors.white,
          ),
        ),
        const SizedBox(height: 20.0),
        ProjectDetailsTechnologiesWidget(
          technologies: project.technologies,
        ),
        const SizedBox(height: 10.0),
        const Divider(),
        const SizedBox(height: 10.0),
        ProjectDetailsSourceCodeWidget(
          sourceCode: project.links.sourceCode,
        ),
      ],
    );
  }
}
