import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';

class BackgroundVideoWidget extends StatelessWidget {
  const BackgroundVideoWidget({
    super.key,
    required this.controller,
    required this.animationOpacityLogo,
    required this.changeAnimationOpacityText,
  });

  final VideoPlayerController controller;
  final double animationOpacityLogo;
  final VoidCallback changeAnimationOpacityText;

  @override
  Widget build(BuildContext context) {
    return AnimatedOpacity(
      duration: const Duration(
        seconds: 5,
      ),
      curve: Curves.easeIn,
      opacity: animationOpacityLogo,
      onEnd: () => changeAnimationOpacityText(),
      child: SizedBox.expand(
        child: FittedBox(
          fit: BoxFit.cover,
          child: SizedBox(
            width: controller.value.size.width,
            height: controller.value.size.height,
            child: VideoPlayer(controller),
          ),
        ),
      ),
    );
  }
}
