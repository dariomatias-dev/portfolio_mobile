import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

import 'package:portfolio/src/models/technology_category_model.dart';

class TechnologiesComponentWidget extends StatelessWidget {
  const TechnologiesComponentWidget({
    super.key,
    required this.categoryTechnologiesUsed,
  });

  final TechnologiesCategoryModel categoryTechnologiesUsed;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          categoryTechnologiesUsed.description,
          style: const TextStyle(
            color: Colors.white,
            fontSize: 14,
          ),
        ),
        const SizedBox(height: 16.0),
        GridView.builder(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          itemCount: categoryTechnologiesUsed.technologies.length,
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 5,
            mainAxisSpacing: 32.0,
            crossAxisSpacing: 44.0,
          ),
          itemBuilder: (context, index) {
            final technology = categoryTechnologiesUsed.technologies[index];
            final String imageName = technology.imageName.imageDarkTheme ??
                technology.imageName.imageStandard;

            return Image.network(
              '${dotenv.env['BASE_URL_IMAGES']}/technologies/${imageName}_logo.png',
            );
          },
        ),
      ],
    );
  }
}
