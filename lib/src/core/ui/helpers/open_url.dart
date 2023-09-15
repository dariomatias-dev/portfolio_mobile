import 'package:flutter/material.dart';

import 'package:portfolio/src/core/ui/helpers/show_alert_dialog.dart';

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

    const String title = 'Aviso';
    const String content = 'Não foi possível abrir a URL.';

    ShowAlertDialog().show(
      screenContext,
      title,
      content,
    );
  }
}
