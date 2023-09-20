import 'package:flutter/material.dart';

import 'package:portfolio/src/screens/technology_screen/components/technology_body_content_widget/technology_utilizers_widget/custom_rich_text_widget.dart';

class TechnologyUtilizersWidget extends StatelessWidget {
  const TechnologyUtilizersWidget({
    super.key,
    required this.userCompanies,
    required this.userApplications,
  });

  final String? userCompanies;
  final String? userApplications;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(
        top: 10.0,
        right: 10.0,
        left: 10.0,
      ),
      child: Column(
        children: [
          if (userCompanies != null)
            CustomRichTextWidget(
              title: 'Empresas que usam:',
              names: userCompanies!,
            ),
          if (userCompanies != null && userApplications != null)
            const SizedBox(height: 4.0),
          if (userApplications != null)
            CustomRichTextWidget(
              title: 'Aplicações que usam:',
              names: userApplications!,
            ),
        ],
      ),
    );
  }
}
