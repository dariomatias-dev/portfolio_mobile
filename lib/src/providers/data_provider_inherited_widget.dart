import 'package:flutter/material.dart';

class DataProviderInheritedWidget extends InheritedWidget {
  const DataProviderInheritedWidget({
    super.key,
    required this.splashScreenContext,
    required this.setSplashScreenContext,
    required this.splashAnimationCompleted,
    required this.updateSplashAnimationCompleted,
    required final Widget child,
  }) : super(child: child);

  final BuildContext? splashScreenContext;
  final Function(BuildContext screenContext) setSplashScreenContext;
  final bool splashAnimationCompleted;
  final VoidCallback updateSplashAnimationCompleted;

  static DataProviderInheritedWidget? of(BuildContext context) {
    return context
        .dependOnInheritedWidgetOfExactType<DataProviderInheritedWidget>();
  }

  @override
  bool updateShouldNotify(DataProviderInheritedWidget oldWidget) {
    return false;
  }
}
