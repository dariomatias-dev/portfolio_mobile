import 'package:flutter/material.dart';

import 'package:portfolio/src/providers/project_data_provider_inherited_widget.dart';

import 'package:portfolio/src/widgets/screen_header_template_widget.dart';

class ProjectScreenHeaderWidget extends StatelessWidget {
  const ProjectScreenHeaderWidget({super.key});

  void _showAlertDialog(BuildContext screenContext) {
    showDialog(
      context: screenContext,
      builder: (context) {
        return AlertDialog(
          title: const Text('Informação'),
          content: const Text(
            'Se estiver assistindo a um vídeo e desejar ver outros conteúdos, basta deslizar para a esquerda ou direita na parte inferior para retroceder ou avançar.',
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

  @override
  Widget build(BuildContext context) {
    final screenContext =
        ProjectDataProviderInheritedWidget.of(context)!.screenContext;

    return ScreenHeaderTemplateWidget(
      screenContext: screenContext,
      action: IconButton(
        onPressed: () {
          _showAlertDialog(screenContext);
        },
        icon: Icon(
          Icons.info_outline_rounded,
          color: Colors.white.withOpacity(0.8),
        ),
      ),
    );
  }
}
