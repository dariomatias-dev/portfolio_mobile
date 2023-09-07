import 'package:flutter/material.dart';

import 'package:portfolio/src/models/project/project_source_code_model.dart';

import 'package:portfolio/src/screens/project_screen/project_body_content_widget/project_details_widget/project_details_source_code_widget/link_button_widget.dart';

class ProjectDetailsSourceCodeWidget extends StatelessWidget {
  const ProjectDetailsSourceCodeWidget({
    super.key,
    required this.sourceCode,
  });

  final ProjectSourceCodeModel sourceCode;

  static TextStyle titleStyle = const TextStyle(
    color: Colors.white,
    fontSize: 16.0,
    fontWeight: FontWeight.w500,
  );

  List<Widget> _generateLinkButtonWidgets() {
    return [
      if (sourceCode.frontend != null) ...[
        LinkButtonWidget(
          name: 'Frontend',
          url: sourceCode.frontend!,
        ),
      ],
      if (sourceCode.backend != null) ...[
        LinkButtonWidget(
          name: 'Backend',
          url: sourceCode.backend!,
        ),
      ],
      if (sourceCode.mobile != null) ...[
        LinkButtonWidget(
          name: 'Mobile',
          url: sourceCode.mobile!,
        ),
      ],
    ];
  }

  @override
  Widget build(BuildContext context) {
    final List<Widget> linkButtonWidgets = _generateLinkButtonWidgets();

    return Column(
      children: [
        if (linkButtonWidgets.length == 1) ...[
          Text(
            'Código-fonte',
            style: titleStyle,
          ),
        ] else ...[
          Text(
            'Códigos-fonte',
            style: titleStyle,
          ),
        ],
        const SizedBox(height: 12.0),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: linkButtonWidgets,
        ),
      ],
    );
  }
}
