import 'package:flutter/material.dart';

import 'package:portfolio/src/core/constants/section_descriptions_constant.dart';
import 'package:portfolio/src/core/ui/widgets/section_data_unavailable_widget.dart';

import 'package:portfolio/src/providers/data_provider_inherited_widget.dart';

import 'package:portfolio/src/screens/home_screen/body_content_widget/projects_section_widget/project_card_widget.dart';

import 'package:portfolio/src/widgets/section_header_widget.dart';

class ProjectsSectionWidget extends StatefulWidget {
  const ProjectsSectionWidget({super.key});

  @override
  State<ProjectsSectionWidget> createState() => _ProjectsSectionWidgetState();
}

class _ProjectsSectionWidgetState extends State<ProjectsSectionWidget> {
  @override
  Widget build(BuildContext context) {
    const sectionName = 'Projetos';
    const imageName = 'projects';

    final projects = DataProviderInheritedWidget.of(context)?.projects;

    return projects == null
        ? const SectionDataUnavailableWidget(
            sectionName: sectionName,
          )
        : Column(
            children: [
              const SectionHeaderWidget(
                sectionName: sectionName,
                imageName: imageName,
              ),
              const SizedBox(height: 20.0),
              Text(
                sectionDescriptionsContant.projects,
                textAlign: TextAlign.justify,
                style: const TextStyle(
                  color: Colors.white,
                ),
              ),
              const SizedBox(height: 40.0),
              SizedBox(
                height: 170.0,
                child: ListView.separated(
                  itemCount: projects.length,
                  scrollDirection: Axis.horizontal,
                  separatorBuilder: (context, index) {
                    return const SizedBox(width: 20.0);
                  },
                  itemBuilder: (context, index) {
                    final project = projects[index];

                    return ProjectCardWidget(
                      projectName: project.name,
                      projectImageUrl: project.files[0].url,
                    );
                  },
                ),
              ),
            ],
          );
  }
}
