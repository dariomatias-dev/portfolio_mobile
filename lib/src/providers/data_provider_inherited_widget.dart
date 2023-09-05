import 'package:flutter/material.dart';

class DataProviderInheritedWidget extends InheritedWidget {
  const DataProviderInheritedWidget({
    super.key,
    required final Widget child,
  }) : super(child: child);

  static DataProviderInheritedWidget? of(BuildContext context) {
    return context
        .dependOnInheritedWidgetOfExactType<DataProviderInheritedWidget>();
  }

  @override
  bool updateShouldNotify(DataProviderInheritedWidget oldWidget) {
    return false;
  }
}
