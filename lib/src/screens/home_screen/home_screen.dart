import 'package:flutter/material.dart';

import 'package:portfolio/src/core/ui/portfolio_images.dart';

import 'package:portfolio/src/screens/home_screen/body_content_widget.dart';
import 'package:portfolio/src/screens/home_screen/profile_avatar_widget.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    const double imageHeight = 130.0;
    final double heightAvailable =
        MediaQuery.sizeOf(context).height - imageHeight - 30.0;

    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Stack(
            children: [
              Stack(
                children: <Widget>[
                  Column(
                    children: [
                      Image.asset(
                        PortfolioImages.backgroundProfile,
                        fit: BoxFit.cover,
                        height: imageHeight,
                        width: double.maxFinite,
                      ),
                      Container(
                        height: heightAvailable,
                      ),
                    ],
                  ),
                  const Positioned(
                    top: 120.0,
                    right: 0,
                    bottom: 0,
                    left: 0,
                    child: BodyContentWidget(),
                  ),
                ],
              ),
              const Positioned(
                top: 78.0,
                left: 20.0,
                child: ProfileAvatarWidget(),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
