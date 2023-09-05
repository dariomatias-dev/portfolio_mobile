import 'package:flutter/material.dart';
import 'package:asyncstate/widget/async_state_builder.dart';

import 'package:portfolio/src/core/ui/portfolio_theme.dart';
import 'package:portfolio/src/core/ui/widgets/portfolio_loader.dart';

import 'package:portfolio/src/providers/data_provider_inherited_widget.dart';

import 'package:portfolio/src/screens/home_screen/home_screen.dart';

import 'package:portfolio/src/screens/splash_screen/splash_screen.dart';

class PortfolioApp extends StatefulWidget {
  const PortfolioApp({super.key});

  @override
  State<PortfolioApp> createState() => _PortfolioAppState();
}

class _PortfolioAppState extends State<PortfolioApp> {
  BuildContext? splashScreenContext;
  bool splashAnimationCompleted = false;
  bool loadedData = false;

  void setSplashScreenContext(BuildContext screenContext) {
    splashScreenContext = screenContext;
  }

  void updateSplashAnimationCompleted() {
    splashAnimationCompleted = true;
    navigateToHomeScreen();
  }

  Future<void> fetchData() async {
    await Future.delayed(
      const Duration(seconds: 30),
      () {
        loadedData = true;
      },
    );

    navigateToHomeScreen();
  }

  void navigateToHomeScreen() {
    if (splashAnimationCompleted && loadedData) {
      Navigator.pushReplacementNamed(
        splashScreenContext!,
        '/home',
      );
    }
  }

  @override
  void initState() {
    fetchData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return DataProviderInheritedWidget(
      splashScreenContext: splashScreenContext,
      setSplashScreenContext: setSplashScreenContext,
      splashAnimationCompleted: splashAnimationCompleted,
      updateSplashAnimationCompleted: updateSplashAnimationCompleted,
      child: AsyncStateBuilder(
        customLoader: const PortfolioLoader(),
        builder: (asyncNavigatorObserver) {
          return MaterialApp(
            debugShowCheckedModeBanner: false,
            title: 'Portfólio',
            theme: PortfolioTheme.themeData,
            navigatorObservers: [asyncNavigatorObserver],
            routes: {
              '/': (context) => const SplashScreen(),
              '/home': (context) => const HomeScreen(),
            },
          );
        },
      ),
    );
  }
}
