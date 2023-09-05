import 'package:flutter/material.dart';
import 'package:asyncstate/class/async_loader_handler.dart';
import 'package:asyncstate/widget/async_state_builder.dart';

import 'package:portfolio/src/core/ui/portfolio_theme.dart';
import 'package:portfolio/src/core/ui/widgets/portfolio_loader.dart';
import 'package:portfolio/src/models/project/project_model.dart';

import 'package:portfolio/src/providers/data_provider_inherited_widget.dart';

import 'package:portfolio/src/repositories/projects_repository.dart';

import 'package:portfolio/src/screens/home_screen/home_screen.dart';

import 'package:portfolio/src/screens/splash_screen/splash_screen.dart';

class PortfolioApp extends StatefulWidget {
  const PortfolioApp({super.key});

  @override
  State<PortfolioApp> createState() => _PortfolioAppState();
}

class _PortfolioAppState extends State<PortfolioApp> {
  BuildContext? splashScreenContext;
  ValueNotifier<bool> splashAnimationCompleted = ValueNotifier<bool>(false);
  ValueNotifier<bool> loadedData = ValueNotifier<bool>(false);
  AsyncLoaderHandler? handler;

  final ProjectsRepository projectRepository = ProjectsRepository();

  List<ProjectModel>? projects;

  void setSplashScreenContext(BuildContext screenContext) {
    splashScreenContext = screenContext;
  }

  void updateSplashAnimationCompleted() {
    splashAnimationCompleted.value = true;

    navigateToHomeScreen();
  }

  Future<void> fetchData() async {
    final List<Future<List<dynamic>>> requests = [
      projectRepository.readProjects(),
    ];

    final results = await Future.wait(requests);

    setState(() {
      projects = results[0].cast<ProjectModel>();
    });

    loadedData.value = true;

    navigateToHomeScreen();
  }

  void navigateToHomeScreen() {
    if (splashAnimationCompleted.value && loadedData.value) {
      Navigator.pushReplacementNamed(
        splashScreenContext!,
        '/home',
      );
    }
  }

  @override
  void initState() {
    splashAnimationCompleted.addListener(
      () {
        if (splashAnimationCompleted.value && !loadedData.value) {
          handler = AsyncLoaderHandler.start();
        } else if (splashAnimationCompleted.value && loadedData.value) {
          handler?.close();
        }
      },
    );

    fetchData();
    super.initState();
  }

  @override
  void dispose() {
    splashAnimationCompleted.dispose();
    loadedData.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return DataProviderInheritedWidget(
      splashScreenContext: splashScreenContext,
      setSplashScreenContext: setSplashScreenContext,
      splashAnimationCompleted: splashAnimationCompleted.value,
      updateSplashAnimationCompleted: updateSplashAnimationCompleted,
      projects: projects,
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
