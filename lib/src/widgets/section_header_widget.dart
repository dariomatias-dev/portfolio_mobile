import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

class SectionHeaderWidget extends StatelessWidget {
  const SectionHeaderWidget({
    super.key,
    required this.sectionTitle,
    required this.imageName,
  });

  final String sectionTitle;
  final String imageName;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: 60.0,
      child: Stack(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(12.0),
            child: Opacity(
              opacity: 0.6,
              child: Image.network(
                '${dotenv.env['BASE_URL_IMAGES']}/background_image_sections/$imageName.png',
                fit: BoxFit.cover,
                width: double.infinity,
              ),
            ),
          ),
          Center(
            child: Text(
              sectionTitle,
              style: const TextStyle(
                color: Colors.white,
                letterSpacing: 4,
                fontSize: 18.0,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
