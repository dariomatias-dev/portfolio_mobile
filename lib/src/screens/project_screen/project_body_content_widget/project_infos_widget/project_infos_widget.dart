import 'package:flutter/material.dart';

import 'package:portfolio/src/core/ui/helpers/open_url.dart';

import 'package:portfolio/src/providers/project_data_provider_inherited_widget.dart';

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
        Text(
          project.description,
          textAlign: TextAlign.justify,
          style: const TextStyle(
            color: Colors.white,
          ),
        ),
        const SizedBox(height: 6.0),
        const Text(
          'O que irá encontrar:',
          style: TextStyle(
            color: Colors.white,
            fontSize: 16.0,
            fontWeight: FontWeight.w500,
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(
            top: 2.0,
            left: 12.0,
          ),
          child: ListView.separated(
            itemCount: project.details.length,
            shrinkWrap: true,
            separatorBuilder: (context, index) {
              return const SizedBox(height: 2.0);
            },
            itemBuilder: (context, index) {
              final detail = project.details[index];

              return Text(
                '• $detail',
                style: const TextStyle(
                  color: Colors.white,
                ),
              );
            },
          ),
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
