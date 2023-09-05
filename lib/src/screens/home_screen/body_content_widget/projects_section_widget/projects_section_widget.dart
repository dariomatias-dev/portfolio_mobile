import 'package:flutter/material.dart';

import 'package:portfolio/src/core/constants/section_descriptions_constant.dart';
import 'package:portfolio/src/core/ui/helpers/snapshot_widget_builder.dart';

import 'package:portfolio/src/models/project/project_model.dart';
import 'package:portfolio/src/providers/data_provider_inherited_widget.dart';

import 'package:portfolio/src/repositories/projects_repository.dart';

import 'package:portfolio/src/screens/home_screen/body_content_widget/projects_section_widget/project_card_widget.dart';

import 'package:portfolio/src/widgets/section_header_widget.dart';

class ProjectsSectionWidget extends StatefulWidget {
  const ProjectsSectionWidget({super.key});

  @override
  State<ProjectsSectionWidget> createState() => _ProjectsSectionWidgetState();
}

class _ProjectsSectionWidgetState extends State<ProjectsSectionWidget> {
  final ProjectsRepository projectRepository = ProjectsRepository();
  final SnapshotWidgetBuilder snapshotWidgetBuilder = SnapshotWidgetBuilder();

  Future<List<ProjectModel>> fetchData() async {
    return await projectRepository.readProjects();
  }

  @override
  Widget build(BuildContext context) {
    const sectionTitle = 'Projetos';
    final sectionType = sectionTitle.toLowerCase();
    const imageName = 'projects';

    final projects = DataProviderInheritedWidget.of(context)?.projects;

    return projects == null
        ? Center(
            child: Text(
              'Não foi possível carregar a seção $sectionType.',
              style: const TextStyle(
                color: Colors.white,
              ),
            ),
          )
        : Column(
            children: [
              SectionHeaderWidget(
                sectionTitle: sectionType,
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
