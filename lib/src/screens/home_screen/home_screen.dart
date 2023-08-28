import 'package:flutter/material.dart';

import 'package:portfolio/src/core/ui/portfolio_images.dart';

import 'package:portfolio/src/screens/home_screen/body_content_widget.dart';
import 'package:portfolio/src/screens/home_screen/profile_avatar_widget.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    const double contentHeight = 120.0;
    final double heightAvailable =
        MediaQuery.sizeOf(context).height - contentHeight;

    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Stack(
            children: [
              Stack(
                children: <Widget>[
                  Column(
                    children: [
                      SizedBox(
                        height: 130.0,
                        width: double.maxFinite,
                        child: Image.asset(
                          PortfolioImages.backgroundProfile,
                          fit: BoxFit.cover,
                        ),
                      ),
                      Container(
                        height: heightAvailable,
                      ),
                    ],
                  ),
                  const Positioned(
                    top: contentHeight,
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
