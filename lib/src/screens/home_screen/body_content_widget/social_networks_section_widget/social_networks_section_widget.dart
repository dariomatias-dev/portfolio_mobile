import 'package:flutter/material.dart';

import 'package:portfolio/src/core/constants/section_descriptions_constant.dart';
import 'package:portfolio/src/core/ui/widgets/section_data_unavailable_widget.dart';

import 'package:portfolio/src/providers/data_provider_inherited_widget.dart';

import 'package:portfolio/src/screens/home_screen/body_content_widget/social_networks_section_widget/social_network_card_widget.dart';

import 'package:portfolio/src/widgets/section_header_widget.dart';

class SocialNetworksSectionWidget extends StatefulWidget {
  const SocialNetworksSectionWidget({super.key});

  @override
  State<SocialNetworksSectionWidget> createState() =>
      _SocialNetworksSectionWidgetState();
}

class _SocialNetworksSectionWidgetState
    extends State<SocialNetworksSectionWidget> {
  @override
  Widget build(BuildContext context) {
    const sectionName = 'Redes Sociais';
    const imageName = 'social_networks';

    final socialNetworks =
        DataProviderInheritedWidget.of(context)?.socialNetworks;

    return socialNetworks == null
        ? const SectionDataUnavailableWidget(
            sectionName: sectionName,
          )
        : Column(
            children: [
              const SectionHeaderWidget(
                sectionName: sectionName,
                imageName: imageName,
              ),
              const SizedBox(height: 20.0),
              Text(
                sectionDescriptionsContant.socialNetworks,
                textAlign: TextAlign.justify,
                style: const TextStyle(
                  color: Colors.white,
                ),
              ),
              const SizedBox(height: 40.0),
              Container(
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
              ),
            ],
          );
  }
}
