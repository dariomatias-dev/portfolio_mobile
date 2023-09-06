import 'package:portfolio/src/core/routes/portfolio_route_names.dart';

import 'package:portfolio/src/screens/home_screen/home_screen.dart';
import 'package:portfolio/src/screens/splash_screen/splash_screen.dart';

final portfolioRoutes = {
  PortfolioRouteNames.initial: (context) => const SplashScreen(),
  PortfolioRouteNames.home: (context) => const HomeScreen(),
};
