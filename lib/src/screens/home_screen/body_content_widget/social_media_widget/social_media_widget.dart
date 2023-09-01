import 'package:flutter/material.dart';

import 'package:portfolio/src/core/ui/helpers/snapshot_widget_builder.dart';

import 'package:portfolio/src/models/social_media_model.dart';

import 'package:portfolio/src/screens/home_screen/body_content_widget/social_media_widget/social_media_card_widget.dart';

import 'package:portfolio/src/repositories/social_media_repository.dart';

class SocialMediaWidget extends StatefulWidget {
  const SocialMediaWidget({super.key});

  @override
  State<SocialMediaWidget> createState() => _SocialMediaWidgetState();
}

class _SocialMediaWidgetState extends State<SocialMediaWidget> {
  final socialMediaRepository = SocialMediaRepository();
  final SnapshotWidgetBuilder snapshotWidgetBuilder = SnapshotWidgetBuilder();

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: socialMediaRepository.readSocialMedia(),
      builder: (context, snapshot) {
        const sectionType = 'redes sociais';

        Widget contentWidget(List<dynamic> data) {
          final socialMedia = data.cast<SocialMediaModel>();

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
              itemCount: socialMedia.length,
              itemBuilder: (context, index) {
                return SocialMediaCardWidget(
                  socialMediaName: socialMedia[index].name,
                  socialMediaLink: socialMedia[index].link,
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
