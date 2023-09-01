import 'package:flutter/material.dart';
import 'package:portfolio/src/core/ui/portfolio_colors.dart';

import 'package:portfolio/src/models/project/project_model.dart';

import 'package:portfolio/src/repositories/project_repository.dart';

class ProjectsSectionWidget extends StatefulWidget {
  const ProjectsSectionWidget({super.key});

  @override
  State<ProjectsSectionWidget> createState() => _ProjectsSectionWidgetState();
}

class _ProjectsSectionWidgetState extends State<ProjectsSectionWidget> {
  final ProjectRepository projectRepository = ProjectRepository();

  Future<List<ProjectModel>> fetchData() async {
    return await projectRepository.readProjects();
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 170.0,
      child: FutureBuilder(
        future: fetchData(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(
              child: CircularProgressIndicator(
                color: Colors.blue,
              ),
            );
          } else if (snapshot.hasError) {
            return const Center(
              child: Text(
                'Não foi possível carregar a seção de projetos.',
                style: TextStyle(
                  color: Colors.white,
                ),
              ),
            );
          } else if (!snapshot.hasData) {
            return const Center(
              child: Text(
                'Secão de projetos indisponível.',
                style: TextStyle(
                  color: Colors.white,
                ),
              ),
            );
          }

          final projects = snapshot.data!;
          const borderRadiusValue = 10.0;

          return ListView.separated(
            itemCount: projects.length,
            scrollDirection: Axis.horizontal,
            separatorBuilder: (context, index) {
              return const SizedBox(width: 20.0);
            },
            itemBuilder: (context, index) {
              final project = projects[index];

              return ConstrainedBox(
                constraints: const BoxConstraints(
                  maxWidth: 250.0,
                ),
                child: Container(
                  decoration: BoxDecoration(
                    color: PortfolioColors.darkGrey,
                    borderRadius: BorderRadius.circular(borderRadiusValue),
                  ),
                  child: Column(
                    children: [
                      ClipRRect(
                        borderRadius: BorderRadius.circular(borderRadiusValue),
                        child: AspectRatio(
                          aspectRatio: 16 / 9,
                          child: Image.network(
                            project.files[0].url,
                          ),
                        ),
                      ),
                      Expanded(
                        child: Center(
                          child: Text(
                            project.name,
                            style: const TextStyle(
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              );
            },
          );
        },
      ),
    );
  }
}
