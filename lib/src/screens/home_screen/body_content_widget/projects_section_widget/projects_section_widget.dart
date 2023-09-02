import 'package:flutter/material.dart';

import 'package:portfolio/src/core/constants/section_descriptions_constant.dart';
import 'package:portfolio/src/core/ui/helpers/snapshot_widget_builder.dart';

import 'package:portfolio/src/models/project/project_model.dart';

import 'package:portfolio/src/repositories/project_repository.dart';

import 'package:portfolio/src/screens/home_screen/body_content_widget/projects_section_widget/project_card_widget.dart';

import 'package:portfolio/src/widgets/section_header_widget.dart';

class ProjectsSectionWidget extends StatefulWidget {
  const ProjectsSectionWidget({super.key});

  @override
  State<ProjectsSectionWidget> createState() => _ProjectsSectionWidgetState();
}

class _ProjectsSectionWidgetState extends State<ProjectsSectionWidget> {
  final ProjectRepository projectRepository = ProjectRepository();
  final SnapshotWidgetBuilder snapshotWidgetBuilder = SnapshotWidgetBuilder();

  Future<List<ProjectModel>> fetchData() async {
    return await projectRepository.readProjects();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        vertical: 10.0,
      ),
      child: FutureBuilder(
          future: fetchData(),
          builder: (context, snapshot) {
            const sectionTitle = 'Projetos';
            final sectionType = sectionTitle.toUpperCase();

            Widget contentWidget(List<dynamic> data) {
              final projects = data.cast<ProjectModel>();

              return Column(
                children: [
                  SectionHeaderWidget(
                    sectionTitle: sectionType,
                    imageUrl:
                        'https://static.vecteezy.com/ti/vetor-gratis/p1/664173-abstratos-tecnologia-fundo-gratis-vetor.jpg',
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

            return snapshotWidgetBuilder.builder(
              snapshot,
              sectionType,
              contentWidget,
            );
          }),
    );
  }
}
