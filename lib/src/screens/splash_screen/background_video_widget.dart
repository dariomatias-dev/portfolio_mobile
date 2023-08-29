import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';

class BackgroundVideoWidget extends StatefulWidget {
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
  State<BackgroundVideoWidget> createState() => _BackgroundVideoWidgetState();
}

class _BackgroundVideoWidgetState extends State<BackgroundVideoWidget> {
  @override
  Widget build(BuildContext context) {
    final VideoPlayerController controller = widget.controller;

    return AnimatedOpacity(
      duration: const Duration(
        seconds: 5,
      ),
      curve: Curves.easeIn,
      opacity: widget.animationOpacityLogo,
      onEnd: () => widget.changeAnimationOpacityText(),
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
