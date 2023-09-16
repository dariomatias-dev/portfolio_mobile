import 'package:flutter/material.dart';

import 'package:portfolio/src/core/routes/portfolio_route_names.dart';
import 'package:portfolio/src/core/ui/helpers/navigation_slide_transition.dart';
import 'package:portfolio/src/core/ui/portfolio_colors.dart';
import 'package:portfolio/src/models/project/project_model.dart';

import 'package:portfolio/src/providers/data_provider_inherited_widget.dart';

import 'package:portfolio/src/screens/project_screen/project_screen.dart';

class ProjectCardWidget extends StatelessWidget {
  const ProjectCardWidget({
    super.key,
    required this.projectName,
    required this.projectImageUrl,
    required this.screenContext,
  });

  final String projectName;
  final String projectImageUrl;
  final BuildContext screenContext;

  void _checkProjectData(BuildContext context) {
    final projects = DataProviderInheritedWidget.of(context)?.projects;

    final project = projects?.firstWhere((value) {
      return value.name == projectName;
    });

    int nonNullVariableCount = 0;
    String developmentArea = '';

    if (project?.frontend != null) {
      developmentArea = 'frontend';
      nonNullVariableCount++;
    }
    if (project?.mobile != null) {
      developmentArea = 'mobile';
      nonNullVariableCount++;
    }
    if (project?.backend != null) {
      developmentArea = 'backend';
      nonNullVariableCount++;
    }

    if (nonNullVariableCount >= 2) {
      _chooseDevelopmentArea(project);
    } else {
      _navegar(
        context,
        developmentArea,
      );
    }
  }

  void _chooseDevelopmentArea(ProjectModel? project) {
    showDialog(
      context: screenContext,
      builder: (context) {
        return SimpleDialog(
          title: Text(
            'Selecione a área do projeto $projectName',
            style: const TextStyle(
              color: Colors.black,
            ),
          ),
          backgroundColor: Colors.white,
          children: [
            if (project?.frontend != null)
              CustomListTile(
                developmentAreaName: 'Frontend',
                icon: Icons.desktop_windows_outlined,
                navegar: _navegar,
                simpleDialogContext: context,
              ),
            if (project?.backend != null)
              CustomListTile(
                developmentAreaName: 'Backend',
                icon: Icons.settings,
                navegar: _navegar,
                simpleDialogContext: context,
              ),
            if (project?.mobile != null)
              CustomListTile(
                developmentAreaName: 'Mobile',
                icon: Icons.phone_android_outlined,
                navegar: _navegar,
                simpleDialogContext: context,
              ),
          ],
        );
      },
    );
  }

  void _navegar(BuildContext context, String developmentArea) {
    NavigationSlideTransition().navegate(
      context,
      PortfolioRouteNames.project,
      () => ProjectScreen(
        projectName: projectName,
        developmentArea: developmentArea,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    const borderRadiusValue = 10.0;

    return GestureDetector(
      onTap: () => _checkProjectData(context),
      child: ConstrainedBox(
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
                    projectImageUrl,
                  ),
                ),
              ),
              Expanded(
                child: Center(
                  child: Text(
                    projectName,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class CustomListTile extends StatelessWidget {
  const CustomListTile({
    super.key,
    required this.developmentAreaName,
    required this.icon,
    required this.navegar,
    required this.simpleDialogContext,
  });

  final String developmentAreaName;
  final IconData icon;
  final void Function(BuildContext, String) navegar;
  final BuildContext simpleDialogContext;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: () {
        Navigator.pop(simpleDialogContext);
        navegar(
          context,
          developmentAreaName.toLowerCase(),
        );
      },
      leading: Icon(
        icon,
        color: Colors.black,
      ),
      title: Text(
        developmentAreaName,
        style: const TextStyle(
          color: Colors.black,
        ),
      ),
    );
  }
}
