import 'package:flutter/material.dart';

import 'package:portfolio/src/core/ui/portfolio_colors.dart';

import 'package:portfolio/src/models/project/project_links_model.dart';

import 'package:portfolio/src/screens/project_screen/project_body_content_widget/project_details_widget/project_details_source_code_widget/project_details_source_code_widget.dart';
import 'package:portfolio/src/screens/project_screen/project_body_content_widget/project_details_widget/project_details_technologies_widget.dart';

class ProjectDetailsWidget extends StatelessWidget {
  const ProjectDetailsWidget({
    super.key,
    required this.name,
    required this.description,
    required this.technologies,
    required this.links,
  });

  final String name;
  final String description;
  final List<String> technologies;
  final ProjectLinksModel links;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              name,
              style: const TextStyle(
                color: Colors.white,
                fontSize: 18,
                fontWeight: FontWeight.w700,
              ),
            ),
            if (links.demo != null) ...[
              GestureDetector(
                onTap: () {},
                child: Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 12.0,
                    vertical: 6.0,
                  ),
                  decoration: BoxDecoration(
                    color: PortfolioColors.darkGrey,
                    borderRadius: BorderRadius.circular(16.0),
                  ),
                  child: Text(
                    'demo',
                    style: TextStyle(
                      color: Colors.grey.shade300,
                    ),
                  ),
                ),
              ),
            ],
          ],
        ),
        const SizedBox(height: 10.0),
        const Text(
          "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book.",
          textAlign: TextAlign.justify,
          style: TextStyle(
            color: Colors.white,
          ),
        ),
        const SizedBox(height: 20.0),
        ProjectDetailsTechnologiesWidget(
          technologies: technologies,
        ),
        const SizedBox(height: 10.0),
        const Divider(),
        const SizedBox(height: 10.0),
        ProjectDetailsSourceCodeWidget(
          sourceCode: links.sourceCode,
        ),
      ],
    );
  }
}
