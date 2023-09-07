import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

import 'package:portfolio/src/core/ui/portfolio_colors.dart';

class LinkButtonWidget extends StatelessWidget {
  const LinkButtonWidget({
    super.key,
    required this.name,
    required this.url,
  });

  final String name;
  final String url;

  Future<void> _launchUrl() async {
    if (!await launchUrl(Uri.parse(url))) {}
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onDoubleTap: () => _launchUrl(),
      child: Container(
        padding: const EdgeInsets.symmetric(
          horizontal: 16.0,
          vertical: 8.0,
        ),
        decoration: BoxDecoration(
          color: PortfolioColors.darkGrey,
          borderRadius: BorderRadius.circular(12.0),
        ),
        child: Center(
          child: Text(
            name,
            style: const TextStyle(
              color: Colors.white,
            ),
          ),
        ),
      ),
    );
  }
}
