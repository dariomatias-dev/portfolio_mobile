import 'package:flutter/material.dart';

import 'package:portfolio/src/models/project/project_model.dart';

import 'package:portfolio/src/widgets/project_card_list_view_widget/project_card_widget/custom_list_tile_widget.dart';

void chooseDevelopmentArea(
  BuildContext screenContext,
  ProjectModel? project,
) {
  showDialog(
    context: screenContext,
    builder: (context) {
      return SimpleDialog(
        title: Text(
          'Selecione a área do projeto ${project?.name}',
          style: const TextStyle(
            color: Colors.black,
          ),
        ),
        backgroundColor: Colors.white,
        children: [
          if (project?.frontend != null)
            CustomListTile(
              projectName: project!.name,
              developmentAreaName: 'Frontend',
              icon: Icons.desktop_windows_outlined,
              simpleDialogContext: context,
            ),
          if (project?.backend != null)
            CustomListTile(
              projectName: project!.name,
              developmentAreaName: 'Backend',
              icon: Icons.settings,
              simpleDialogContext: context,
            ),
          if (project?.mobile != null)
            CustomListTile(
              projectName: project!.name,
              developmentAreaName: 'Mobile',
              icon: Icons.phone_android_outlined,
              simpleDialogContext: context,
            ),
        ],
      );
    },
  );
}
