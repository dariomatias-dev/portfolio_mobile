import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:portfolio/src/models/project/project_model.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

class ProjectBodyContentWidget extends StatefulWidget {
  const ProjectBodyContentWidget({
    super.key,
    required this.screenContext,
    required this.project,
  });

  final BuildContext screenContext;
  final ProjectModel project;

  @override
  State<ProjectBodyContentWidget> createState() =>
      _ProjectBodyContentWidgetState();
}

class _ProjectBodyContentWidgetState extends State<ProjectBodyContentWidget> {
  final CarouselController controller = CarouselController();

  @override
  Widget build(BuildContext context) {
    final files = widget.project.files;

    return Stack(
      children: [
        ClipRRect(
          borderRadius: const BorderRadius.vertical(
            top: Radius.circular(28.0),
          ),
          child: CarouselSlider.builder(
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

              if (file.type == 'img') {
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
                      mute: false,
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
          ),
        ),
        Positioned(
          top: 10.0,
          left: 10.0,
          child: Container(
            padding: const EdgeInsets.all(12.0),
            decoration: const BoxDecoration(
              color: Colors.black54,
              shape: BoxShape.circle,
            ),
            child: GestureDetector(
              onTap: () {
                Navigator.pop(context);
              },
              child: const Tooltip(
                message: 'Sair',
                child: Icon(
                  Icons.arrow_back_ios_new_rounded,
                  color: Colors.white,
                  size: 16.0,
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
