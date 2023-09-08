import 'package:flutter/material.dart';

import 'package:portfolio/src/core/routes/portfolio_route_names.dart';
import 'package:portfolio/src/core/ui/elevated_button_style.dart';
import 'package:portfolio/src/core/ui/helpers/navigation_slide_transition.dart';

import 'package:portfolio/src/screens/technology_screen/technology_screen.dart';

class ProjectDetailsTechnologiesWidget extends StatelessWidget {
  const ProjectDetailsTechnologiesWidget({
    super.key,
    required this.technologies,
  });

  final List<String> technologies;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 40.0,
      child: ListView.separated(
        itemCount: technologies.length,
        scrollDirection: Axis.horizontal,
        shrinkWrap: true,
        separatorBuilder: (context, index) {
          return const SizedBox(width: 10.0);
        },
        itemBuilder: (context, index) {
          final technologyName = technologies[index];

          return ElevatedButton(
            onPressed: () {
              NavigationSlideTransition().navegate(
                context,
                PortfolioRouteNames.technology,
                () => TechnologyScreen(
                  technologyName: technologyName,
                ),
              );
            },
            style: ElevatedButtonStyle.defaultStyle,
            child: Text(
              technologyName,
              style: const TextStyle(
                color: Colors.white,
              ),
            ),
          );
        },
      ),
    );
  }
}
