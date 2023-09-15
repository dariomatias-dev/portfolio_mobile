import 'package:flutter/material.dart';

import 'package:portfolio/src/core/constants/section_descriptions_constant.dart';
import 'package:portfolio/src/core/ui/widgets/section_data_unavailable_widget.dart';

import 'package:portfolio/src/providers/data_provider_inherited_widget.dart';

import 'package:portfolio/src/widgets/project_card_list_view_widget/project_card_list_view_widget.dart';
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
              ),
              const SizedBox(height: 40.0),
              ProjectCardListViewWidget(
                projects: projects,
              ),
            ],
          );
  }
}
