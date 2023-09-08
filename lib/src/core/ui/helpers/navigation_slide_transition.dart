import 'package:flutter/material.dart';

class NavigationSlideTransition {
  void navegate(
    BuildContext context,
    String screenName,
    Widget Function() screen,
  ) {
    Navigator.push(
      context,
      PageRouteBuilder(
        settings: RouteSettings(
          name: screenName,
        ),
        pageBuilder: (
          context,
          animation,
          secondaryAnimation,
        ) {
          return screen();
        },
        transitionsBuilder: (
          context,
          animation,
          secondaryAnimation,
          child,
        ) {
          const begin = Offset(0.0, 1.0);
          const end = Offset.zero;
          final tween = Tween(
            begin: begin,
            end: end,
          );
          final offsetAnimation = animation.drive(tween);

          return SlideTransition(
            position: offsetAnimation,
            child: child,
          );
        },
      ),
    );
  }
}
