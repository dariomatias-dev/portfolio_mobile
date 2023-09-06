import 'package:flutter/material.dart';

import 'package:portfolio/src/core/routes/portfolio_route_names.dart';
import 'package:portfolio/src/core/ui/portfolio_colors.dart';

import 'package:portfolio/src/screens/project_screen/project_screen.dart';

class ProjectCardWidget extends StatelessWidget {
  const ProjectCardWidget({
    super.key,
    required this.projectName,
    required this.projectImageUrl,
  });

  final String projectName;
  final String projectImageUrl;

  @override
  Widget build(BuildContext context) {
    const borderRadiusValue = 10.0;

    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          PageRouteBuilder(
            settings: RouteSettings(
              name: PortfolioRouteNames.project,
            ),
            pageBuilder: (
              context,
              animation,
              secondaryAnimation,
            ) {
              return ProjectScreen(
                projectName: projectName,
              );
            },
            transitionsBuilder: (
              context,
              animation,
              secondaryAnimation,
              child,
            ) {
              const begin = Offset(0.0, 1.0);
              const end = Offset.zero;
              final tween = Tween(
                begin: begin,
                end: end,
              );
              final offsetAnimation = animation.drive(tween);

              return SlideTransition(
                position: offsetAnimation,
                child: child,
              );
            },
          ),
        );
      },
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
                    style: const TextStyle(
                      color: Colors.white,
                    ),
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
