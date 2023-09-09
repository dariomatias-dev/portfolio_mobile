import 'package:flutter/material.dart';

import 'package:portfolio/src/screens/project_screen/project_body_content_widget/media_carousel_widget.dart';
import 'package:portfolio/src/screens/project_screen/project_body_content_widget/project_details_widget/project_details_widget.dart';
import 'package:portfolio/src/screens/project_screen/project_body_content_widget/project_screen_header_widget.dart';

class ProjectBodyContentWidget extends StatelessWidget {
  const ProjectBodyContentWidget({super.key});
  @override
  Widget build(BuildContext context) {
    return const Stack(
      children: [
        Column(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.vertical(
                top: Radius.circular(28.0),
              ),
              child: MediaCarouselWidget(),
            ),
            Padding(
              padding: EdgeInsets.only(
                right: 10.0,
                bottom: 20.0,
                left: 10.0,
              ),
              child: ProjectDetailsWidget(),
            ),
          ],
        ),
        ProjectScreenHeaderWidget(),
      ],
    );
  }
}
