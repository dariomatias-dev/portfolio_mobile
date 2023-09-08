import 'package:flutter/material.dart';

import 'package:portfolio/src/core/ui/portfolio_colors.dart';

class ElevatedButtonStyle {
  static final ButtonStyle defaultStyle = ElevatedButton.styleFrom(
    backgroundColor: PortfolioColors.darkGrey,
    foregroundColor: Colors.grey.shade800,
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(10.0),
    ),
  );
}
