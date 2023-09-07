import 'package:flutter/material.dart';

import 'package:url_launcher/url_launcher.dart';

class OpenUrl {
  OpenUrl({
    required this.screenContext,
  });

  final BuildContext screenContext;

  Future<void> launch(String url) async {
    if (!await launchUrl(Uri.parse(url))) {
      _alertDialo();
    }
  }

  void _alertDialo() {
    showDialog(
      context: screenContext,
      builder: (context) {
        return AlertDialog(
          title: const Text('Aviso'),
          content: const Text(
            'Não foi possível abrir a URL',
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: const Text('Ok'),
            ),
          ],
        );
      },
    );
  }
}
