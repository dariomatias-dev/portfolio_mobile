import 'package:flutter/material.dart';
import 'package:portfolio/src/widgets/link_button_widget.dart';

class TechnologyLinksWidget extends StatelessWidget {
  const TechnologyLinksWidget({
    super.key,
    required this.officialWebsite,
    required this.githubRepository,
    required this.playground,
  });

  final String officialWebsite;
  final String githubRepository;
  final String? playground;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          const SizedBox(width: 10.0),
          LinkButtonWidget(
            name: 'Site Oficial',
            url: officialWebsite,
          ),
          const SizedBox(width: 10.0),
          LinkButtonWidget(
            name: 'Repositório',
            url: githubRepository,
          ),
          if (playground != null) ...[
            const SizedBox(width: 10.0),
            LinkButtonWidget(
              name: 'Playground',
              url: playground!,
            ),
          ],
          const SizedBox(width: 10.0),
        ],
      ),
    );
  }
}
