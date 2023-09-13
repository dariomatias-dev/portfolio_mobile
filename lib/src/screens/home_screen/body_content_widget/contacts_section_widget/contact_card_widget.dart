import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:url_launcher/url_launcher.dart';

class ContactCardWidget extends StatelessWidget {
  const ContactCardWidget({
    super.key,
    required this.contactName,
    required this.contactLink,
  });

  final String contactName;
  final String contactLink;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Image.network(
        '${dotenv.env['BASE_URL_IMAGES']}/contacts/${contactName.toLowerCase()}_logo.png',
        width: 26,
        height: 26,
      ),
      title: Text(contactName),
      titleTextStyle: const TextStyle(
        color: Colors.white,
      ),
      trailing: const Icon(
        Icons.link,
        color: Colors.white,
      ),
      onTap: () async {
        await launchUrl(
          Uri.parse(contactLink),
        );
      },
    );
  }
}
