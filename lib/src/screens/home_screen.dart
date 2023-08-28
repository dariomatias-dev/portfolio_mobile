import 'package:flutter/material.dart';
import 'package:portfolio/src/core/ui/portfolio_colors.dart';
import 'package:portfolio/src/core/ui/portfolio_images.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: SingleChildScrollView(
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
                      height: MediaQuery.sizeOf(context).height,
                      decoration: BoxDecoration(
                        color: PortfolioColors.backgroundColor,
                      ),
                    ),
                  ],
                ),
                Positioned(
                  top: 120.0,
                  right: 0,
                  bottom: 0,
                  left: 0,
                  child: Container(
                    padding: const EdgeInsets.only(
                      top: 50.0,
                    ),
                    alignment: Alignment.centerLeft,
                    decoration: BoxDecoration(
                      color: PortfolioColors.backgroundColor,
                      borderRadius: const BorderRadius.vertical(
                        top: Radius.circular(10.0),
                      ),
                    ),
                    child: const Padding(
                      padding: EdgeInsets.symmetric(
                        horizontal: 20.0,
                      ),
                      child: Column(
                        children: [
                          Text(
                            'Dário Matias',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 14,
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
            Positioned(
              top: 78.0,
              left: 20.0,
              child: Container(
                padding: const EdgeInsets.all(4.0),
                decoration: BoxDecoration(
                  color: PortfolioColors.backgroundColor,
                  shape: BoxShape.circle,
                ),
                child: Image.asset(
                  PortfolioImages.myPhoto,
                  width: 80.0,
                  height: 80.0,
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
