import 'package:flutter/material.dart';

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
        children: [
          const Text(
            'Clique no link a seguir para poder fazer o download do APK:',
            textAlign: TextAlign.center,
            softWrap: true,
            style: TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.w500,
            ),
          ),
          TextButton(
            onPressed: () {},
            child: const Text(
              'Download',
              style: TextStyle(
                color: Colors.blue,
                fontWeight: FontWeight.w400,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
