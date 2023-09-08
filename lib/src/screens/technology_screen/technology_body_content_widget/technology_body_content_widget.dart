import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

import 'package:portfolio/src/providers/technology_data_provider_inherited_widget.dart';

import 'package:portfolio/src/widgets/screen_header_template_widget.dart';

class TechnologyBodyContentWidget extends StatelessWidget {
  const TechnologyBodyContentWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final screenContext =
        TechnologyDataProviderInheritedWidget.of(context)!.screenContext;
    final technology =
        TechnologyDataProviderInheritedWidget.of(context)!.technology;
    final imageName = technology.imageName.imageDarkTheme ??
        technology.imageName.imageStandard;

    return Stack(
      children: [
        Container(
          width: MediaQuery.sizeOf(context).width,
          padding: const EdgeInsets.only(
            top: 20.0,
          ),
          child: Column(
            children: [
              Image.network(
                '${dotenv.env['BASE_URL_IMAGES']}/technologies/${imageName}_logo.png',
                height: 100.0,
                fit: BoxFit.cover,
              ),
              const SizedBox(height: 20.0),
              Text(
                technology.name,
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 20.0,
                  fontWeight: FontWeight.w500,
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 10,
                  vertical: 20.0,
                ),
                child: Text(
                  technology.description,
                  textAlign: TextAlign.justify,
                  style: const TextStyle(
                    color: Colors.white,
                  ),
                ),
              ),
              Container(
                padding: const EdgeInsets.symmetric(
                  vertical: 8.0,
                ),
                decoration: const BoxDecoration(
                  color: Colors.white,
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Column(
                      children: [
                        const Text(
                          'Criada por:',
                          style: TextStyle(
                            fontSize: 16.0,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Text(
                          technology.createdBy,
                          style: const TextStyle(
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ],
                    ),
                    Column(
                      children: [
                        const Text(
                          'Lançada em:',
                          style: TextStyle(
                            fontSize: 16.0,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Text(
                          technology.createdIn,
                          style: const TextStyle(
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
        ScreenHeaderTemplateWidget(
          screenContext: screenContext,
        ),
      ],
    );
  }
}
