import 'package:flutter/material.dart';

import 'package:portfolio/src/core/ui/helpers/snapshot_widget_builder.dart';

import 'package:portfolio/src/models/social_network_model.dart';

import 'package:portfolio/src/screens/home_screen/body_content_widget/social_networks_section_widget/social_network_card_widget.dart';

import 'package:portfolio/src/repositories/social_network_repository.dart';

class SocialNetworksSectionWidget extends StatefulWidget {
  const SocialNetworksSectionWidget({super.key});

  @override
  State<SocialNetworksSectionWidget> createState() => _SocialNetworksSectionWidgetState();
}

class _SocialNetworksSectionWidgetState extends State<SocialNetworksSectionWidget> {
  final socialMediaRepository = SocialNetworkRepository();
  final SnapshotWidgetBuilder snapshotWidgetBuilder = SnapshotWidgetBuilder();

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: socialMediaRepository.readSocialNetworks(),
      builder: (context, snapshot) {
        const sectionType = 'redes sociais';

        Widget contentWidget(List<dynamic> data) {
          final socialNetworks = data.cast<SocialNetworkModel>();

          return Container(
            padding: const EdgeInsets.symmetric(
              horizontal: 6.0,
              vertical: 10.0,
            ),
            decoration: BoxDecoration(
              border: Border.all(
                color: Colors.grey.shade800,
              ),
              borderRadius: BorderRadius.circular(10.0),
            ),
            child: ListView.builder(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemCount: socialNetworks.length,
              itemBuilder: (context, index) {
                final socialNetwork = socialNetworks[index];

                return SocialNetworkCardWidget(
                  socialNetworkName: socialNetwork.name,
                  socialNetworkLink: socialNetwork.link,
                );
              },
            ),
          );
        }

        return snapshotWidgetBuilder.builder(
          snapshot,
          sectionType,
          contentWidget,
        );
      },
    );
  }
}
