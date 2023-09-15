import 'package:flutter/material.dart';

class ScreenHeaderTemplateWidget extends StatelessWidget {
  const ScreenHeaderTemplateWidget({
    super.key,
    required this.screenContext,
    this.action,
  });

  final BuildContext screenContext;
  final Widget? action;

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
            GestureDetector(
              onTap: () {
                Navigator.pop(screenContext);
              },
              child: Container(
                padding: const EdgeInsets.all(12.0),
                decoration: const BoxDecoration(
                  color: Colors.black54,
                  shape: BoxShape.circle,
                ),
                child: const Tooltip(
                  message: 'Sair',
                  child: Icon(
                    Icons.arrow_back_ios_new_rounded,
                    size: 16.0,
                  ),
                ),
              ),
            ),
            if (action != null) action!,
          ],
        ),
      ),
    );
  }
}
