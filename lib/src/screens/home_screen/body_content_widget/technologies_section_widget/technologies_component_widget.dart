import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

import 'package:portfolio/src/core/routes/portfolio_route_names.dart';

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
            color: Colors.white,
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
                Navigator.push(
                  context,
                  PageRouteBuilder(
                    settings: RouteSettings(
                      name: PortfolioRouteNames.technology,
                    ),
                    pageBuilder: (
                      context,
                      animation,
                      secondaryAnimation,
                    ) {
                      return TechnologyScreen(
                        technologyName: technology.name,
                      );
                    },
                    transitionsBuilder: (
                      context,
                      animation,
                      secondaryAnimation,
                      child,
                    ) {
                      const begin = Offset(0.0, 1.0);
                      const end = Offset.zero;
                      final tween = Tween(
                        begin: begin,
                        end: end,
                      );
                      final offsetAnimation = animation.drive(tween);

                      return SlideTransition(
                        position: offsetAnimation,
                        child: child,
                      );
                    },
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
