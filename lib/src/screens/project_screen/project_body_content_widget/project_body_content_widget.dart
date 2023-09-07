import 'package:flutter/material.dart';

import 'package:portfolio/src/models/project/project_model.dart';

import 'package:portfolio/src/screens/project_screen/project_body_content_widget/media_carousel_widget.dart';
import 'package:portfolio/src/screens/project_screen/project_body_content_widget/project_screen_header_widget.dart';

class ProjectBodyContentWidget extends StatelessWidget {
  const ProjectBodyContentWidget({
    super.key,
    required this.screenContext,
    required this.project,
  });

  final BuildContext screenContext;
  final ProjectModel project;

  @override
  Widget build(BuildContext context) {
    final files = project.media;

    return Stack(
      children: [
        ClipRRect(
          borderRadius: const BorderRadius.vertical(
            top: Radius.circular(28.0),
          ),
          child: MediaCarouselWidget(
            files: files,
          ),
        ),
        ProjectScreenHeaderWidget(
          screenContext: screenContext,
        ),
      ],
    );
  }
}
