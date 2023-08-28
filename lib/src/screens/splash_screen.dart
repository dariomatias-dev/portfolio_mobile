import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';
import 'package:fade_out_particle/fade_out_particle.dart';

import 'package:portfolio/src/core/ui/portfolio_videos.dart';

void main() => runApp(const SplashScreen());

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  double _animationOpacityLogo = 0.0;
  double _animationOpacityText = 0.0;
  bool _disappear = false;
  late VideoPlayerController _controller;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      _animationOpacityLogo = 0.3;
    });

    _controller = VideoPlayerController.asset(PortfolioVideos.video2)
      ..initialize().then((value) {
        setState(() {});
      })
      ..play();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Portfólio',
      home: Scaffold(
        backgroundColor: Colors.black,
        body: Stack(
          alignment: Alignment.center,
          children: <Widget>[
            AnimatedOpacity(
              duration: const Duration(
                seconds: 5,
              ),
              curve: Curves.easeIn,
              opacity: _animationOpacityLogo,
              onEnd: () {
                setState(() {
                  _animationOpacityText = 1.0;
                });
              },
              child: SizedBox.expand(
                child: FittedBox(
                  fit: BoxFit.cover,
                  child: SizedBox(
                    width: _controller.value.size.width,
                    height: _controller.value.size.height,
                    child: VideoPlayer(_controller),
                  ),
                ),
              ),
            ),
            AnimatedOpacity(
              duration: const Duration(
                seconds: 4,
              ),
              curve: Curves.easeIn,
              opacity: _animationOpacityText,
              onEnd: () {
                Future.delayed(
                  const Duration(
                    seconds: 1,
                  ),
                  () {
                    setState(() {
                      _disappear = true;
                    });
                  },
                );
              },
              child: FadeOutParticle(
                disappear: _disappear,
                curve: Curves.easeIn,
                duration: const Duration(
                  seconds: 4,
                ),
                onAnimationEnd: () {
                  Navigator.pushReplacementNamed(
                    context,
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
            ),
          ],
        ),
      ),
    );
  }

  @override
  void dispose() {
    super.dispose();
    _controller.dispose();
  }
}
