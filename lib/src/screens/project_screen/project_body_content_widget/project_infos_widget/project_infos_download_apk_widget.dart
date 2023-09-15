import 'package:flutter/material.dart';

import 'package:portfolio/src/widgets/link_button_widget.dart';

class ProjectInfosDownloadApkWidget extends StatelessWidget {
  const ProjectInfosDownloadApkWidget({
    super.key,
    required this.link,
  });

  final String link;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: Wrap(
        alignment: WrapAlignment.center,
        runSpacing: 10.0,
        children: [
          const Text(
            'Clique no link a seguir para poder fazer o download do APK:',
            textAlign: TextAlign.center,
            softWrap: true,
            style: TextStyle(
              fontSize: 16.0,
              fontWeight: FontWeight.w500,
            ),
          ),
          LinkButtonWidget(
            name: 'Download',
            url: link,
          ),
        ],
      ),
    );
  }
}
