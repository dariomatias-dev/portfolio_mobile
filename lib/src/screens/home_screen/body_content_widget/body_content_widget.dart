import 'package:flutter/material.dart';
import 'package:portfolio/src/screens/home_screen/body_content_widget/email_widget.dart';
import 'package:portfolio/src/screens/home_screen/body_content_widget/projects_section_widget/projects_section_widget.dart';

import 'package:portfolio/src/screens/home_screen/body_content_widget/social_networks_section_widget/social_networks_section_widget.dart';
import 'package:portfolio/src/screens/home_screen/body_content_widget/technologies_section_widget/technologies_section_widget.dart';

class BodyContentWidget extends StatelessWidget {
  const BodyContentWidget({super.key});

  @override
  Widget build(BuildContext context) {
    const String email = 'matiasdario75@gmail.com';

    return Container(
      padding: const EdgeInsets.only(
        top: 60.0,
        right: 20.0,
        left: 20.0,
      ),
      child: const Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Dário Matias',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 20,
                  fontWeight: FontWeight.w600,
                ),
              ),
              EmailWidget(
                email: email,
              ),
            ],
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
          SizedBox(height: 20.0),
          Text(
            'A possibilidade de poder criar o que eu quiser sem a ajuda de ninguém, através do meu próprio esforço e dedicação, me motiva a estudar cada vez mais. Por essa razão estou sempre buscando novas experiências e conhecimentos para me aprimorar o máximo possível.',
            textAlign: TextAlign.justify,
            softWrap: true,
            style: TextStyle(
              color: Colors.white,
            ),
          ),
          SizedBox(height: 20.0),
          Divider(),
          SizedBox(height: 30.0),
          ProjectsSectionWidget(),
          SizedBox(height: 30.0),
          Divider(),
          SizedBox(height: 30.0),
          TechnologiesSectionWidget(),
          SizedBox(height: 30.0),
          Divider(),
          SizedBox(height: 30.0),
          SocialNetworksSectionWidget(),
          SizedBox(height: 40.0),
        ],
      ),
    );
  }
}
