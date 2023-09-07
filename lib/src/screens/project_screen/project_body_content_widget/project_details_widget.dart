import 'package:flutter/material.dart';

import 'package:portfolio/src/models/project/project_links_model.dart';

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
        Text(
          name,
          style: const TextStyle(
            color: Colors.white,
            fontSize: 18,
            fontWeight: FontWeight.w700,
          ),
        ),
        const SizedBox(height: 10.0),
        const Text(
          "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book.",
          textAlign: TextAlign.justify,
          style: TextStyle(
            color: Colors.white,
          ),
        ),
      ],
    );
  }
}
