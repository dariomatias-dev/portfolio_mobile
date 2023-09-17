import 'package:flutter/material.dart';
import 'package:portfolio/src/models/project/project_model.dart';

class ProjectDataProviderInheritedWidget extends InheritedWidget {
  const ProjectDataProviderInheritedWidget({
    super.key,
    required final Widget child,
    required this.screenContext,
    required this.project,
    required this.developmentArea,
  }) : super(child: child);

  final BuildContext screenContext;
  final ProjectModel project;
  final String developmentArea;

  static ProjectDataProviderInheritedWidget? of(BuildContext context) {
    return context.dependOnInheritedWidgetOfExactType<
        ProjectDataProviderInheritedWidget>();
  }

  @override
  bool updateShouldNotify(ProjectDataProviderInheritedWidget oldWidget) {
    return true;
  }
}
