import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

class TechnologiesSectionWidget extends StatelessWidget {
  const TechnologiesSectionWidget({
    super.key,
    required this.description,
  });

  final String description;

  static final List<String> technologies = List.filled(10, 'flutter');

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          description,
          style: const TextStyle(
            color: Colors.white,
            fontSize: 14,
          ),
        ),
        const SizedBox(height: 6.0),
        GridView.builder(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          itemCount: technologies.length,
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 5,
            mainAxisSpacing: 20.0,
            crossAxisSpacing: 20.0,
          ),
          itemBuilder: (context, index) {
            return Padding(
              padding: const EdgeInsets.all(12.0),
              child: Image.network(
                '${dotenv.env['BASE_URL_IMAGES']}/${technologies[index]}_icon.png',
              ),
            );
          },
        ),
      ],
    );
  }
}
