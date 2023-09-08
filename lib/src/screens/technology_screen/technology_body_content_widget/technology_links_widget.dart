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
    final sizedBoxWidth = playground != null ? 10.0 : 20.0;

    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        children: [
          SizedBox(width: sizedBoxWidth),
          LinkButtonWidget(
            name: 'Site Oficial',
            url: officialWebsite,
          ),
          SizedBox(width: sizedBoxWidth),
          LinkButtonWidget(
            name: 'Repositório',
            url: githubRepository,
          ),
          if (playground != null) ...[
            SizedBox(width: sizedBoxWidth),
            LinkButtonWidget(
              name: 'Playground',
              url: playground!,
            ),
          ],
          SizedBox(width: sizedBoxWidth),
        ],
      ),
    );
  }
}
