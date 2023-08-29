import 'package:flutter/material.dart';

import 'package:portfolio/src/screens/home_screen/network_links_widget/network_links_widget.dart';

class BodyContentWidget extends StatelessWidget {
  const BodyContentWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(
        top: 60.0,
        right: 20.0,
        left: 20.0,
      ),
      decoration: const BoxDecoration(
        borderRadius: BorderRadius.vertical(
          top: Radius.circular(10.0),
        ),
      ),
      child: const Column(
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
          NetworkLinksWidget(),
        ],
      ),
    );
  }
}
