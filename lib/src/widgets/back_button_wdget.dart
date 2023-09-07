import 'package:flutter/material.dart';

class BackButtonWidget extends StatelessWidget {
  const BackButtonWidget({
    super.key,
    required this.screenContext,
  });

  final BuildContext screenContext;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
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
            color: Colors.white,
            size: 16.0,
          ),
        ),
      ),
    );
  }
}
