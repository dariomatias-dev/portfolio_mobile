import 'package:flutter/material.dart';

import 'package:portfolio/src/core/ui/portfolio_images.dart';

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
                  Positioned(
                    top: contentHeight,
                    right: 0,
                    bottom: 0,
                    left: 0,
                    child: Container(
                      padding: const EdgeInsets.only(
                        top: 60.0,
                      ),
                      decoration: const BoxDecoration(
                        color: Colors.black,
                        borderRadius: BorderRadius.vertical(
                          top: Radius.circular(10.0),
                        ),
                      ),
                      child: const Padding(
                        padding: EdgeInsets.symmetric(
                          horizontal: 20.0,
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Dário Matias',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 20,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                            SizedBox(height: 4.0),
                            Row(
                              children: [
                                Icon(
                                  Icons.location_on_outlined,
                                  color: Colors.white54,
                                ),
                                Text(
                                  'Areial, PB - Brasil',
                                  style: TextStyle(
                                    color: Colors.white54,
                                    fontSize: 12,
                                  ),
                                ),
                              ],
                            ),
                            SizedBox(height: 10.0),
                            Text(
                              "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book.",
                              textAlign: TextAlign.justify,
                              softWrap: true,
                              style: TextStyle(
                                color: Colors.white,
                              ),
                            ),
                            SizedBox(height: 20.0),
                            Divider(),
                            SizedBox(height: 20.0),
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
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
