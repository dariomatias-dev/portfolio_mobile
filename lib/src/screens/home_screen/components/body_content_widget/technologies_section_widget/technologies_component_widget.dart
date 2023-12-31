import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

import 'package:portfolio/src/core/routes/portfolio_route_names.dart';
import 'package:portfolio/src/core/ui/helpers/navigation_slide_transition.dart';

import 'package:portfolio/src/models/technology/technology_model.dart';

import 'package:portfolio/src/screens/technology_screen/technology_screen.dart';

class TechnologiesComponentWidget extends StatelessWidget {
  const TechnologiesComponentWidget({
    super.key,
    required this.description,
    required this.technologies,
  });

  final String description;
  final List<TechnologyModel> technologies;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          description,
          textAlign: TextAlign.justify,
          style: const TextStyle(
            fontSize: 14,
          ),
        ),
        const SizedBox(height: 30.0),
        GridView.builder(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          itemCount: technologies.length,
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 5,
            mainAxisSpacing: 20.0,
            crossAxisSpacing: 40.0,
          ),
          itemBuilder: (context, index) {
            final technology = technologies[index];
            final String imageName = technology.imageName.imageDarkTheme ??
                technology.imageName.imageStandard;

            return GestureDetector(
              onTap: () {
                NavigationSlideTransition().navegate(
                  context,
                  PortfolioRouteNames.technology,
                  () => TechnologyScreen(
                    technologyName: technology.name,
                  ),
                );
              },
              child: Image.network(
                '${dotenv.env['BASE_URL_IMAGES']}/technologies/${imageName}_logo.png',
              ),
            );
          },
        ),
      ],
    );
  }
}
