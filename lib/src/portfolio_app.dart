import 'package:flutter/material.dart';
import 'package:portfolio/src/screens/splash_screen.dart';

class PortfolioApp extends StatelessWidget {
  const PortfolioApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Portfólio',
      routes: {
        '/': (context) => const SplashScreen(),
      },
    );
  }
}
