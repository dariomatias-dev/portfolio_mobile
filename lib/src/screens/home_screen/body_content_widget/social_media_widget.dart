import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:url_launcher/url_launcher.dart';

import 'package:portfolio/src/repositories/social_media_repository.dart';

class SocialMediaWidget extends StatefulWidget {
  const SocialMediaWidget({super.key});

  @override
  State<SocialMediaWidget> createState() => _SocialMediaWidgetState();
}

class _SocialMediaWidgetState extends State<SocialMediaWidget> {
  final socialMediaRepository = SocialMediaRepository();

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: socialMediaRepository.readSocialMedia(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Center(
            child: CircularProgressIndicator(
              color: Colors.blue,
            ),
          );
        } else if (snapshot.hasError) {
          return const Center(
            child: Text(
              'Não foi possível carregar a seção de redes sociais.',
              style: TextStyle(
                color: Colors.white,
              ),
            ),
          );
        } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
          return const Center(
            child: Text(
              'Secão de redes sociais indisponível.',
              style: TextStyle(
                color: Colors.white,
              ),
            ),
          );
        }

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
            itemCount: snapshot.data!.length,
            itemBuilder: (context, index) {
              final socialMedia = snapshot.data![index];

              return ListTile(
                leading: Image.network(
                  '${dotenv.env['BASE_URL_IMAGES']}/social_media/${socialMedia.name.toLowerCase()}_logo.png',
                  width: 26,
                  height: 26,
                ),
                title: Text(socialMedia.name),
                titleTextStyle: const TextStyle(
                  color: Colors.white,
                ),
                trailing: const Icon(
                  Icons.link,
                  color: Colors.white,
                ),
                onTap: () async {
                  await launchUrl(
                    Uri.parse(socialMedia.link),
                  );
                },
              );
            },
          ),
        );
      },
    );
  }
}