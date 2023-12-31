import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';
import 'package:dots_indicator/dots_indicator.dart';

import 'package:portfolio/src/models/project/project_media_model.dart';

import 'package:portfolio/src/providers/project_data_provider_inherited_widget.dart';

class MediaCarouselWidget extends StatefulWidget {
  const MediaCarouselWidget({super.key});

  @override
  State<MediaCarouselWidget> createState() => _MediaCarouselWidgetState();
}

class _MediaCarouselWidgetState extends State<MediaCarouselWidget> {
  final CarouselController controller = CarouselController();

  int currentImageIndex = 0;

  @override
  Widget build(BuildContext context) {
    final developmentArea =
        ProjectDataProviderInheritedWidget.of(context)!.developmentArea;
    final project = ProjectDataProviderInheritedWidget.of(context)!.project;
    late final List<ProjectMediaModel> media;

    if (developmentArea == 'frontend') {
      media = project.frontend!.media;
    } else if (developmentArea == 'backend') {
      media = project.backend!.media;
    } else {
      media = project.mobile!.media;
    }

    return Stack(
      alignment: Alignment.center,
      children: [
        Padding(
          padding: const EdgeInsets.only(
            bottom: 20.0,
          ),
          child: CarouselSlider.builder(
            carouselController: controller,
            itemCount: media.length,
            options: CarouselOptions(
              aspectRatio: 16 / 9,
              autoPlayAnimationDuration: const Duration(seconds: 1),
              autoPlayCurve: Curves.fastOutSlowIn,
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
                ),
                builder: (context, player) {
                  return player;
                },
              );
            },
          ),
        ),
        Positioned(
          bottom: -4.0,
          child: DotsIndicator(
            dotsCount: media.length,
            position: currentImageIndex,
            decorator: DotsDecorator(
              color: Colors.white.withOpacity(0.20),
              activeColor: Colors.blue,
            ),
          ),
        )
      ],
    );
  }
}
