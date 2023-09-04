import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class EmailWidget extends StatelessWidget {
  const EmailWidget({
    super.key,
    required this.email,
  });

  final String email;

  _launchGmail() async {
    final Uri emailUri = Uri(
      scheme: 'mailto',
      path: email,
    );

    if (!await launchUrl(emailUri)) {
      throw 'Não foi possível abrir o Gmail.';
    }
  }

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: () {
        _launchGmail();
      },
      child: Text(
        email,
        style: const TextStyle(
          color: Colors.white54,
          fontSize: 12,
        ),
      ),
    );
  }
}
