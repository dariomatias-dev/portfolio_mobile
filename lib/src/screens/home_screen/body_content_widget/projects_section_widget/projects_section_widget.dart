import 'package:flutter/material.dart';

import 'package:portfolio/src/core/ui/helpers/snapshot_widget_builder.dart';

import 'package:portfolio/src/models/project/project_model.dart';

import 'package:portfolio/src/repositories/project_repository.dart';

import 'package:portfolio/src/screens/home_screen/body_content_widget/projects_section_widget/project_card_widget.dart';

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
            const sectionType = 'projetos';

            Widget contentWidget(List<dynamic> data) {
              final projects = data.cast<ProjectModel>();

              return Column(
                children: [
                  SizedBox(
                    width: double.infinity,
                    height: 100.0,
                    child: Stack(
                      children: [
                        ClipRRect(
                          borderRadius: BorderRadius.circular(16.0),
                          child: Opacity(
                            opacity: 0.6,
                            child: Image.network(
                              'https://c0.wallpaperflare.com/preview/524/860/912/screen-code-coding-programming.jpg',
                              fit: BoxFit.cover,
                              width: double.infinity,
                            ),
                          ),
                        ),
                        const Center(
                          child: Text(
                            'Projetos',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 18.0,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ],
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
