import 'package:flutter/material.dart';
import 'package:portfolio/src/providers/project_data_provider_inherited_widget.dart';

import 'package:url_launcher/url_launcher.dart';

class OpenUrl {
  OpenUrl({
    required this.context,
  });

  final BuildContext context;

  Future<void> launch(String url) async {
    if (!await launchUrl(
      Uri.parse(url),
      mode: LaunchMode.externalApplication,
    )) {
      _alertDialog();
    }
  }

  void _alertDialog() {
    final screenContext =
        ProjectDataProviderInheritedWidget.of(context)!.screenContext;

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
