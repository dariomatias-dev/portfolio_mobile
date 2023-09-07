import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

import 'package:portfolio/src/providers/project_data_provider_inherited_widget.dart';

class MediaCarouselWidget extends StatefulWidget {
  const MediaCarouselWidget({super.key});

  @override
  State<MediaCarouselWidget> createState() => _MediaCarouselWidgetState();
}

class _MediaCarouselWidgetState extends State<MediaCarouselWidget> {
  final CarouselController controller = CarouselController();

  @override
  Widget build(BuildContext context) {
    final media = ProjectDataProviderInheritedWidget.of(context)!.project.media;

    return CarouselSlider.builder(
      carouselController: controller,
      itemCount: media.length,
      options: CarouselOptions(
        aspectRatio: 16 / 9,
        autoPlay: true,
        autoPlayInterval: const Duration(seconds: 10),
        autoPlayAnimationDuration: const Duration(seconds: 1),
        autoPlayCurve: Curves.fastOutSlowIn,
        onPageChanged: (index, reason) {
          if (media[index].type == 'video') {
            controller.stopAutoPlay();
          }
        },
        viewportFraction: 1.0,
      ),
      itemBuilder: (context, index, realIndex) {
        final file = media[index];

        if (file.type == 'image') {
          return Image.network(
            file.url,
          );
        }

        final videoLInk = file.url;
        final videoId = videoLInk.substring(
          videoLInk.lastIndexOf('/') + 1,
        );

        return YoutubePlayerBuilder(
          player: YoutubePlayer(
            controller: YoutubePlayerController(
              initialVideoId: videoId,
              flags: const YoutubePlayerFlags(
                autoPlay: true,
              ),
            ),
            onEnded: (metaData) {
              controller.startAutoPlay();
            },
          ),
          builder: (context, player) {
            return player;
          },
        );
      },
    );
  }
}
