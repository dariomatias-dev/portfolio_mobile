import 'package:flutter/material.dart';

import 'package:portfolio/src/models/project/project_model.dart';

import 'package:portfolio/src/screens/project_screen/project_body_content_widget/media_carousel_widget.dart';

class ProjectBodyContentWidget extends StatelessWidget {
  const ProjectBodyContentWidget({
    super.key,
    required this.screenContext,
    required this.project,
  });

  final BuildContext screenContext;
  final ProjectModel project;

  void _showDialog() {
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
    final files = project.media;

    return Stack(
      children: [
        ClipRRect(
          borderRadius: const BorderRadius.vertical(
            top: Radius.circular(28.0),
          ),
          child: MediaCarouselWidget(
            files: files,
          ),
        ),
        Positioned(
          top: 10.0,
          child: Container(
            width: MediaQuery.sizeOf(context).width,
            padding: const EdgeInsets.symmetric(
              horizontal: 10.0,
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  padding: const EdgeInsets.all(12.0),
                  decoration: const BoxDecoration(
                    color: Colors.black54,
                    shape: BoxShape.circle,
                  ),
                  child: GestureDetector(
                    onTap: () {
                      Navigator.pop(context);
                    },
                    child: const Tooltip(
                      message: 'Sair',
                      child: Icon(
                        Icons.arrow_back_ios_new_rounded,
                        color: Colors.white,
                        size: 16.0,
                      ),
                    ),
                  ),
                ),
                IconButton(
                  onPressed: () {
                    _showDialog();
                  },
                  icon: Icon(
                    Icons.info_outline_rounded,
                    color: Colors.white.withOpacity(0.8),
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
