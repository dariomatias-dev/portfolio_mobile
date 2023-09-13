import 'package:flutter/material.dart';
import 'package:portfolio/src/models/profile_model.dart';

import 'package:portfolio/src/models/project/project_model.dart';
import 'package:portfolio/src/models/contact_model.dart';
import 'package:portfolio/src/models/technology/technology_model.dart';

class DataProviderInheritedWidget extends InheritedWidget {
  const DataProviderInheritedWidget({
    super.key,
    required this.splashScreenContext,
    required this.setSplashScreenContext,
    required this.splashAnimationCompleted,
    required this.updateSplashAnimationCompleted,
    required this.profile,
    required this.projects,
    required this.technologies,
    required this.contacts,
    required final Widget child,
  }) : super(child: child);

  final BuildContext? splashScreenContext;
  final Function(BuildContext screenContext) setSplashScreenContext;
  final bool splashAnimationCompleted;
  final VoidCallback updateSplashAnimationCompleted;

  final ProfileModel? profile;
  final List<ProjectModel>? projects;
  final List<TechnologyModel>? technologies;
  final List<ContactModel>? contacts;

  static DataProviderInheritedWidget? of(BuildContext context) {
    return context
        .dependOnInheritedWidgetOfExactType<DataProviderInheritedWidget>();
  }

  @override
  bool updateShouldNotify(DataProviderInheritedWidget oldWidget) {
    return false;
  }
}
