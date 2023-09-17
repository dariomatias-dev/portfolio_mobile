import 'package:flutter/material.dart';

import 'package:portfolio/src/screens/project_screen/project_body_content_widget/media_carousel_widget.dart';

class ProjectBodyContentWidget extends StatelessWidget {
  const ProjectBodyContentWidget({super.key});
  @override
  Widget build(BuildContext context) {
    return const Column(
      children: [
        ClipRRect(
          borderRadius: BorderRadius.vertical(
            top: Radius.circular(28.0),
          ),
          child: MediaCarouselWidget(),
        ),
      ],
    );
  }
}
