import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

import 'package:portfolio/src/models/project/project_media_type_model.dart';

class MediaCarouselWidget extends StatefulWidget {
  const MediaCarouselWidget({
    super.key,
    required this.files,
  });

  final List<ProjectMediaTypeModel> files;

  @override
  State<MediaCarouselWidget> createState() => _MediaCarouselWidgetState();
}

class _MediaCarouselWidgetState extends State<MediaCarouselWidget> {
  final CarouselController controller = CarouselController();

  @override
  Widget build(BuildContext context) {
    final files = widget.files;

    return CarouselSlider.builder(
      carouselController: controller,
      itemCount: files.length,
      options: CarouselOptions(
        aspectRatio: 16 / 9,
        autoPlay: true,
        autoPlayInterval: const Duration(seconds: 10),
        autoPlayAnimationDuration: const Duration(seconds: 1),
        autoPlayCurve: Curves.fastOutSlowIn,
        onPageChanged: (index, reason) {
          if (files[index].type == 'video') {
            controller.stopAutoPlay();
          }
        },
        viewportFraction: 1.0,
      ),
      itemBuilder: (context, index, realIndex) {
        final file = files[index];

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
