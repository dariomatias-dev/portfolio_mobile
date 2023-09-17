import 'package:flutter/material.dart';

import 'package:portfolio/src/providers/data_provider_inherited_widget.dart';

import 'package:portfolio/src/widgets/project_card_list_view_widget/project_card_widget/choose_development_area.dart';
import 'package:portfolio/src/widgets/project_card_list_view_widget/project_card_widget/navegate.dart';

void checkProjectData(
  BuildContext screenContext,
  BuildContext context,
  String projectName,
) {
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
    chooseDevelopmentArea(
      screenContext,
      project,
    );
  } else {
    navegate(
      context,
      projectName,
      developmentArea,
    );
  }
}
