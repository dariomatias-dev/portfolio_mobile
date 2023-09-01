import 'package:flutter/material.dart';
import 'package:portfolio/src/core/ui/helpers/snapshot_widget_builder.dart';

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
  final technologiesCategoryRepository = TechnologiesCategoryRepository();
  final technologiesRepository = TechnologiesRepository();
  final snapshotWidgetBuilder = SnapshotWidgetBuilder();

  Future<List<Object>> fetchData() async {
    final queries = [
      technologiesCategoryRepository.readTechnologiesStatus(),
      technologiesRepository.readTechnologies(),
    ];

    return await Future.wait(queries);
  }

  @override
  void initState() {
    super.initState();
    fetchData();
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: fetchData(),
      builder: (context, snapshot) {
        const sectionType = 'tecnologias';

        Widget contentWidget(List<dynamic> data) {
          final technologies = data[1] as List<TechnologyModel>;
          final List<TechnologyModel> technologiesUsed =
              technologies.where((technology) {
            return technology.status == 'using';
          }).toList();
          final List<TechnologyModel> technologiesFuture =
              technologies.where((technology) {
            return technology.status == 'planned';
          }).toList();

          final technologieCategoriesList = data[0] as List<String>;
          final categoryTechnologiesUsed = TechnologiesCategoryModel(
            description: technologieCategoriesList[1],
            technologies: technologiesUsed,
          );
          final categoryTechnologiesFuture = TechnologiesCategoryModel(
            description: technologieCategoriesList[0],
            technologies: technologiesFuture,
          );

          return Column(
            children: [
              TechnologiesComponentWidget(
                categoryTechnologiesUsed: categoryTechnologiesUsed,
              ),
              const SizedBox(height: 24.0),
              TechnologiesComponentWidget(
                categoryTechnologiesUsed: categoryTechnologiesFuture,
              ),
            ],
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
