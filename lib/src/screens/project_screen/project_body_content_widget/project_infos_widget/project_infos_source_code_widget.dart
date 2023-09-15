import 'package:flutter/material.dart';

import 'package:portfolio/src/models/project/project_source_code_model.dart';

import 'package:portfolio/src/widgets/link_button_widget.dart';

class ProjectInfosSourceCodeWidget extends StatelessWidget {
  const ProjectInfosSourceCodeWidget({
    super.key,
    required this.sourceCode,
  });

  final ProjectSourceCodeModel sourceCode;

  static TextStyle titleStyle = const TextStyle(
    fontSize: 16.0,
    fontWeight: FontWeight.w500,
  );

  List<Widget> _generateLinkButtonWidgets() {
    return [
      if (sourceCode.frontend != null)
        LinkButtonWidget(
          name: 'Frontend',
          url: sourceCode.frontend!,
        ),
      if (sourceCode.backend != null)
        LinkButtonWidget(
          name: 'Backend',
          url: sourceCode.backend!,
        ),
      if (sourceCode.mobile != null)
        LinkButtonWidget(
          name: 'Mobile',
          url: sourceCode.mobile!,
        ),
    ];
  }

  @override
  Widget build(BuildContext context) {
    final List<Widget> linkButtonWidgets = _generateLinkButtonWidgets();

    return Column(
      children: [
        if (linkButtonWidgets.length == 1)
          Text(
            'Código-fonte',
            style: titleStyle,
          )
        else
          Text(
            'Códigos-fonte',
            style: titleStyle,
          ),
        const SizedBox(height: 12.0),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: linkButtonWidgets,
        ),
      ],
    );
  }
}
