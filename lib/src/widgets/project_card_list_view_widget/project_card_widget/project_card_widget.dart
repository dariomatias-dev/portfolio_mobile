import 'package:flutter/material.dart';

import 'package:portfolio/src/core/ui/portfolio_colors.dart';

import 'package:portfolio/src/widgets/project_card_list_view_widget/project_card_widget/check_project_data.dart';

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

  @override
  Widget build(BuildContext context) {
    const borderRadiusValue = 10.0;

    return GestureDetector(
      onTap: () => checkProjectData(
        screenContext,
        context,
        projectName,
      ),
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
