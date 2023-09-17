import 'package:flutter/material.dart';

import 'package:portfolio/src/core/routes/portfolio_route_names.dart';
import 'package:portfolio/src/core/ui/helpers/navigation_slide_transition.dart';

import 'package:portfolio/src/screens/project_screen/project_screen.dart';

void navegate(
  BuildContext context,
  String projectName,
  String developmentArea,
) {
  NavigationSlideTransition().navegate(
    context,
    PortfolioRouteNames.project,
    () => ProjectScreen(
      projectName: projectName,
      developmentArea: developmentArea,
    ),
  );
}
