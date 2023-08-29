import 'package:flutter/material.dart';
import 'package:fade_out_particle/fade_out_particle.dart';

class ContentDisplayWidget extends StatefulWidget {
  const ContentDisplayWidget({
    super.key,
    required this.screenContext,
    required this.animationOpacityText,
    required this.disappear,
    required this.changeDisappear,
  });

  final BuildContext screenContext;
  final double animationOpacityText;
  final bool disappear;
  final VoidCallback changeDisappear;

  @override
  State<ContentDisplayWidget> createState() => _ContentDisplayWidgetState();
}

class _ContentDisplayWidgetState extends State<ContentDisplayWidget> {
  @override
  Widget build(BuildContext context) {
    return AnimatedOpacity(
      duration: const Duration(
        seconds: 4,
      ),
      curve: Curves.easeIn,
      opacity: widget.animationOpacityText,
      onEnd: () {
        Future.delayed(
          const Duration(
            seconds: 1,
          ),
          () => widget.changeDisappear(),
        );
      },
      child: FadeOutParticle(
        disappear: widget.disappear,
        curve: Curves.easeIn,
        duration: const Duration(
          seconds: 4,
        ),
        onAnimationEnd: () {
          Navigator.pushReplacementNamed(
            widget.screenContext,
            '/home',
          );
        },
        child: const Text(
          'Dário Matias',
          style: TextStyle(
            color: Colors.white,
            fontSize: 26,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }
}
