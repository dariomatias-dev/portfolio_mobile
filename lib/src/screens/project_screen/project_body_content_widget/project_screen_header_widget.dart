import 'package:flutter/material.dart';

import 'package:portfolio/src/widgets/back_button_wdget.dart';

class ProjectScreenHeaderWidget extends StatelessWidget {
  const ProjectScreenHeaderWidget({
    super.key,
    required this.screenContext,
  });

  final BuildContext screenContext;

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
    return Positioned(
      top: 10.0,
      child: Container(
        width: MediaQuery.sizeOf(context).width,
        padding: const EdgeInsets.symmetric(
          horizontal: 10.0,
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            BackButtonWidget(
              screenContext: screenContext,
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
    );
  }
}
