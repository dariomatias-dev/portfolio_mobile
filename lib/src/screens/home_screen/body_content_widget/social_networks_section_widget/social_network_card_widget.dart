import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:url_launcher/url_launcher.dart';

class SocialNetworkCardWidget extends StatelessWidget {
  const SocialNetworkCardWidget({
    super.key,
    required this.socialNetworkName,
    required this.socialNetworkLink,
  });

  final String socialNetworkName;
  final String socialNetworkLink;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Image.network(
        '${dotenv.env['BASE_URL_IMAGES']}/social_networks/${socialNetworkName.toLowerCase()}_logo.png',
        width: 26,
        height: 26,
      ),
      title: Text(socialNetworkName),
      titleTextStyle: const TextStyle(
        color: Colors.white,
      ),
      trailing: const Icon(
        Icons.link,
        color: Colors.white,
      ),
      onTap: () async {
        await launchUrl(
          Uri.parse(socialNetworkLink),
        );
      },
    );
  }
}
