import 'package:flutter/material.dart';

import 'package:portfolio/src/core/ui/portfolio_theme.dart';

import 'package:portfolio/src/screens/home_screen/home_screen.dart';
import 'package:portfolio/src/screens/splash_screen.dart';

class PortfolioApp extends StatelessWidget {
  const PortfolioApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Portfólio',
      theme: PortfolioTheme.themeData,
      routes: {
        '/': (context) => const SplashScreen(),
        '/home': (context) => const HomeScreen(),
      },
    );
  }
}
