import 'package:flutter/material.dart';

import 'package:portfolio/src/core/ui/helpers/open_url.dart';
import 'package:portfolio/src/core/ui/portfolio_colors.dart';

class LinkButtonWidget extends StatelessWidget {
  const LinkButtonWidget({
    super.key,
    required this.name,
    required this.url,
  });

  final String name;
  final String url;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () {
        OpenUrl(
          context: context,
        ).launch(url);
      },
      style: ElevatedButton.styleFrom(
        backgroundColor: PortfolioColors.darkGrey,
        foregroundColor: Colors.grey.shade800,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10.0),
        ),
      ),
      child: Text(
        name,
        style: const TextStyle(
          color: Colors.white,
        ),
      ),
    );
  }
}
