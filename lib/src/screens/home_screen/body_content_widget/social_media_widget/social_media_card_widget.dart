import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:url_launcher/url_launcher.dart';

class SocialMediaCardWidget extends StatelessWidget {
  const SocialMediaCardWidget({
    super.key,
    required this.socialMediaName,
    required this.socialMediaLink,
  });

  final String socialMediaName;
  final String socialMediaLink;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Image.network(
        '${dotenv.env['BASE_URL_IMAGES']}/social_media/${socialMediaName.toLowerCase()}_logo.png',
        width: 26,
        height: 26,
      ),
      title: Text(socialMediaName),
      titleTextStyle: const TextStyle(
        color: Colors.white,
      ),
      trailing: const Icon(
        Icons.link,
        color: Colors.white,
      ),
      onTap: () async {
        await launchUrl(
          Uri.parse(socialMediaLink),
        );
      },
    );
  }
}
