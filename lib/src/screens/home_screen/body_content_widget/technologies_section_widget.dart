import 'package:flutter/material.dart';

import 'package:portfolio/src/models/technology_category_model.dart';
import 'package:portfolio/src/models/technology/technology_model.dart';

import 'package:portfolio/src/repositories/technologies_repository.dart';
import 'package:portfolio/src/repositories/technologies_category_repository.dart';

import 'package:portfolio/src/screens/home_screen/body_content_widget/technologies_component_widget.dart';

class TechnologiesSectionWidget extends StatefulWidget {
  const TechnologiesSectionWidget({super.key});

  @override
  State<TechnologiesSectionWidget> createState() =>
      _TechnologiesSectionWidgetState();
}

class _TechnologiesSectionWidgetState extends State<TechnologiesSectionWidget> {
  bool loadedData = false;
  final technologiesCategoryRepository = TechnologiesCategoryRepository();
  final technologiesRepository = TechnologiesRepository();

  TechnologiesCategoryModel? categoryTechnologiesUsed;
  TechnologiesCategoryModel? categoryTechnologiesFuture;

  Future<void> fetchData() async {
    final queries = [
      technologiesCategoryRepository.readTechnologiesStatus(),
      technologiesRepository.readTechnologies(),
    ];

    final results = await Future.wait(queries);

    final technologies = results[1] as List<TechnologyModel>;
    List<TechnologyModel> technologiesUsed = technologies.where((technology) {
      return technology.status == 'using';
    }).toList();
    List<TechnologyModel> technologiesFuture = technologies.where((technology) {
      return technology.status == 'planned';
    }).toList();

    final technologieStatusList = results[0] as List<String>;
    categoryTechnologiesUsed = TechnologiesCategoryModel(
      description: technologieStatusList[1],
      technologies: technologiesUsed,
    );
    categoryTechnologiesFuture = TechnologiesCategoryModel(
      description: technologieStatusList[0],
      technologies: technologiesFuture,
    );

    setState(() {
      loadedData = true;
    });
  }

  @override
  void initState() {
    super.initState();
    fetchData();
  }

  @override
  Widget build(BuildContext context) {
    return loadedData
        ? Column(
            children: [
              TechnologiesComponentWidget(
                categoryTechnologiesUsed: categoryTechnologiesUsed!,
              ),
              const SizedBox(height: 24.0),
              TechnologiesComponentWidget(
                categoryTechnologiesUsed: categoryTechnologiesFuture!,
              ),
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
