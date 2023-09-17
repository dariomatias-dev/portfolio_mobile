import 'package:flutter/material.dart';

import 'package:portfolio/src/widgets/project_card_list_view_widget/project_card_widget/navegate.dart';

class CustomListTile extends StatelessWidget {
  const CustomListTile({
    super.key,
    required this.projectName,
    required this.developmentAreaName,
    required this.icon,
    required this.simpleDialogContext,
  });

  final String projectName;
  final String developmentAreaName;
  final IconData icon;
  final BuildContext simpleDialogContext;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: () {
        Navigator.pop(simpleDialogContext);
        navegate(
          context,
          projectName,
          developmentAreaName.toLowerCase(),
        );
      },
      leading: Icon(
        icon,
        color: Colors.black,
      ),
      title: Text(
        developmentAreaName,
        style: const TextStyle(
          color: Colors.black,
        ),
      ),
    );
  }
}
