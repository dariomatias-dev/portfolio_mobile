import 'package:flutter/material.dart';

import 'package:portfolio/src/core/ui/portfolio_images.dart';

import 'package:portfolio/src/screens/home_screen/body_content_widget/body_content_widget.dart';
import 'package:portfolio/src/screens/home_screen/profile_avatar_widget.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Stack(
            children: [
              Image.asset(
                PortfolioImages.backgroundProfile,
                fit: BoxFit.cover,
                height: 130.0,
                width: double.maxFinite,
              ),
              const Padding(
                padding: EdgeInsets.only(
                  top: 120.0,
                ),
                child: BodyContentWidget(),
              ),
              Positioned(
                top: 120.0,
                right: 0,
                left: 0,
                child: Container(
                  height: 30.0,
                  width: double.maxFinite,
                  decoration: const BoxDecoration(
                    color: Colors.black,
                    borderRadius: BorderRadius.vertical(
                      top: Radius.circular(10.0),
                    ),
                  ),
                ),
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
