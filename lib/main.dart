import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

import 'package:portfolio/src/portfolio_app.dart';

Future main() async {
  await dotenv.load(fileName: '.env');

  runApp(
    const PortfolioApp(),
  );
}
