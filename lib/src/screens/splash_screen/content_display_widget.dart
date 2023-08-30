import 'package:flutter/material.dart';
import 'package:fade_out_particle/fade_out_particle.dart';
import 'package:video_player/video_player.dart';

class ContentDisplayWidget extends StatelessWidget {
  const ContentDisplayWidget({
    super.key,
    required this.screenContext,
    required this.controller,
    required this.animationOpacityText,
    required this.disappear,
    required this.changeDisappear,
  });

  final BuildContext screenContext;
  final VideoPlayerController controller;
  final double animationOpacityText;
  final bool disappear;
  final VoidCallback changeDisappear;

  @override
  Widget build(BuildContext context) {
    return AnimatedOpacity(
      duration: const Duration(
        seconds: 4,
      ),
      curve: Curves.easeIn,
      opacity: animationOpacityText,
      onEnd: () {
        Future.delayed(
          const Duration(
            seconds: 1,
          ),
          () => changeDisappear(),
        );
      },
      child: FadeOutParticle(
        disappear: disappear,
        curve: Curves.easeIn,
        duration: const Duration(
          seconds: 4,
        ),
        onAnimationEnd: () {
          controller.pause();
          Navigator.pushReplacementNamed(
            screenContext,
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
