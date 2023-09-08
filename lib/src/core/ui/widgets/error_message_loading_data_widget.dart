import 'package:flutter/material.dart';

import 'package:portfolio/src/widgets/screen_header_template_widget.dart';

class ErrorMessageLoadingDataWidget extends StatelessWidget {
  const ErrorMessageLoadingDataWidget({
    super.key,
    required this.messageVariation,
    required this.screenContext,
  });

  final String messageVariation;
  final BuildContext screenContext;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        SizedBox(
          height: MediaQuery.sizeOf(context).height,
          child: Center(
            child: Text(
              'Não foi possível carregar os dados $messageVariation',
              style: const TextStyle(
                color: Colors.white,
                fontSize: 14,
                fontWeight: FontWeight.w700,
              ),
            ),
          ),
        ),
        ScreenHeaderTemplateWidget(
          screenContext: screenContext,
        ),
      ],
    );
  }
}
