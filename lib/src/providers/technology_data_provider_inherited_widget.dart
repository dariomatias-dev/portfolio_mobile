import 'package:flutter/material.dart';
import 'package:portfolio/src/models/technology/technology_model.dart';

class TechnologyDataProviderInheritedWidget extends InheritedWidget {
  const TechnologyDataProviderInheritedWidget({
    super.key,
    required final Widget child,
    required this.technology,
  }) : super(child: child);

  final TechnologyModel technology;

  static TechnologyDataProviderInheritedWidget? of(BuildContext context) {
    return context.dependOnInheritedWidgetOfExactType<
        TechnologyDataProviderInheritedWidget>();
  }

  @override
  bool updateShouldNotify(TechnologyDataProviderInheritedWidget oldWidget) {
    return true;
  }
}
