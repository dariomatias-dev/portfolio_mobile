import 'package:flutter/material.dart';

import 'package:portfolio/src/models/project/project_model.dart';

import 'package:portfolio/src/widgets/project_card_list_view_widget/project_card_list_view_widget.dart';

class TechnologyProjectsWidget extends StatelessWidget {
  const TechnologyProjectsWidget({
    super.key,
    required this.technologyProjects,
  });

  final List<ProjectModel> technologyProjects;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: 10.0,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(height: 10.0),
          const Divider(),
          const SizedBox(height: 10.0),
          const Text(
            'Projetos que usam',
            style: TextStyle(
              color: Colors.white,
              fontSize: 16.0,
              fontWeight: FontWeight.w500,
            ),
          ),
          const SizedBox(height: 17.0),
          ProjectCardListViewWidget(
            projects: technologyProjects,
          ),
        ],
      ),
    );
  }
}
