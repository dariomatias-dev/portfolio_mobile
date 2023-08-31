import 'package:flutter/material.dart';

import 'package:portfolio/src/models/technologies_status_model.dart';
import 'package:portfolio/src/models/technology_model.dart';
import 'package:portfolio/src/repositories/technologies_repository.dart';

import 'package:portfolio/src/repositories/technologies_status_repository.dart';

import 'package:portfolio/src/screens/home_screen/body_content_widget/technologies_component_widget.dart';

class TechnologiesSectionWidget extends StatefulWidget {
  const TechnologiesSectionWidget({super.key});

  @override
  State<TechnologiesSectionWidget> createState() =>
      _TechnologiesSectionWidgetState();
}

class _TechnologiesSectionWidgetState extends State<TechnologiesSectionWidget> {
  final technologiesStatusRepository = TechnologiesStatusRepository();
  final technologiesRepository = TechnologiesRepository();

  TechnologieStatusModel? descriptionTechnologiesUsed;
  TechnologieStatusModel? descriptionFutureTechnologies;

  Future<void> fetchData() async {
    final queries = [
      technologiesStatusRepository.readTechnologiesStatus(),
      technologiesRepository.readTechnologies(),
    ];

    final results = await Future.wait(queries);

    final technologieStatusList = results[0] as List<TechnologieStatusModel>;
    descriptionTechnologiesUsed = technologieStatusList[0];
    descriptionFutureTechnologies = technologieStatusList[1];

    final technologies = results[1] as List<TechnologyModel>;
  }

  @override
  void initState() {
    super.initState();
    fetchData();
  }

  @override
  Widget build(BuildContext context) {
    return descriptionTechnologiesUsed != null
        ? Column(
            children: [
              TechnologiesComponentWidget(
                technologieStatus: descriptionTechnologiesUsed!,
              ),
              const SizedBox(height: 20.0),
            ],
          )
        : const Center(
            child: Text(
              'Não foi possível carregar a seção de tecnologias',
              style: TextStyle(
                color: Colors.white,
              ),
            ),
          );
  }
}
