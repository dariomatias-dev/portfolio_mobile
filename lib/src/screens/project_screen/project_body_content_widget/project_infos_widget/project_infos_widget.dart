import 'package:flutter/material.dart';

import 'package:portfolio/src/core/ui/elevated_button_style.dart';
import 'package:portfolio/src/core/ui/helpers/open_url.dart';

import 'package:portfolio/src/providers/project_data_provider_inherited_widget.dart';

import 'package:portfolio/src/screens/project_screen/project_body_content_widget/project_infos_widget/project_infos_details_widget.dart';
import 'package:portfolio/src/screens/project_screen/project_body_content_widget/project_infos_widget/project_infos_technologies_widget.dart';

class ProjectInfosWidget extends StatelessWidget {
  const ProjectInfosWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final project = ProjectDataProviderInheritedWidget.of(context)!.project;
    final developmentArea =
        ProjectDataProviderInheritedWidget.of(context)!.developmentArea;
    final developmentAreaNameCapitalized =
        developmentArea[0].toUpperCase() + developmentArea.substring(1);

    late final String projectDescription;
    late final List<String> projectDetails;
    late final List<String> technologies;
    late final String sourceCode;

    String? urlAccessProject;
    IconData? accessProjectButtonIcon;

    if (developmentArea == 'frontend') {
      projectDescription = project.frontend!.description;
      projectDetails = project.frontend!.details;
      technologies = project.frontend!.technologies;
      sourceCode = project.frontend!.sourceCode;
      urlAccessProject = project.frontend!.demo;
      accessProjectButtonIcon = Icons.visibility_outlined;
    } else if (developmentArea == 'backend') {
      projectDescription = project.backend!.description;
      projectDetails = project.backend!.details;
      technologies = project.backend!.technologies;
      sourceCode = project.backend!.sourceCode;
    } else {
      projectDescription = project.mobile!.description;
      projectDetails = project.mobile!.details;
      technologies = project.mobile!.technologies;
      sourceCode = project.mobile!.sourceCode;
      urlAccessProject = project.mobile!.downloadApk;
      accessProjectButtonIcon = Icons.download_sharp;
    }

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              '${project.name} - $developmentAreaNameCapitalized',
              style: const TextStyle(
                fontSize: 18.0,
                fontWeight: FontWeight.w700,
              ),
            ),
            if (urlAccessProject != null)
              IconButton(
                onPressed: () {
                  OpenUrl(
                    context: context,
                  ).launch(urlAccessProject!);
                },
                icon: Icon(
                  accessProjectButtonIcon,
                  color: Colors.white54,
                  size: 28.0,
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
        const SizedBox(height: 20.0),
        ProjectInfosTechnologiesWidget(
          technologies: technologies,
        ),
        const SizedBox(height: 10.0),
        const Divider(),
        const SizedBox(height: 10.0),
        SizedBox(
          width: double.infinity,
          height: 44.0,
          child: ElevatedButton(
            onPressed: () {
              OpenUrl(
                context: context,
              ).launch(sourceCode);
            },
            style: ElevatedButtonStyle.defaultStyle,
            child: const Text('Código fonte'),
          ),
        )
      ],
    );
  }
}
