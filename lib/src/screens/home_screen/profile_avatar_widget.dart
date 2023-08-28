import 'package:flutter/material.dart';

import 'package:portfolio/src/core/ui/portfolio_images.dart';

class ProfileAvatarWidget extends StatelessWidget {
  const ProfileAvatarWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(4.0),
      decoration: const BoxDecoration(
        color: Colors.black,
        shape: BoxShape.circle,
      ),
      child: Image.asset(
        PortfolioImages.myPhoto,
        width: 80.0,
        height: 80.0,
        fit: BoxFit.cover,
      ),
    );
  }
}
