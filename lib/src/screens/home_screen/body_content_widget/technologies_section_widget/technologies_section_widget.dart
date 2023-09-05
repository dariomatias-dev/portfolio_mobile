import 'package:flutter/material.dart';

import 'package:portfolio/src/core/constants/section_descriptions_constant.dart';
import 'package:portfolio/src/core/ui/helpers/snapshot_widget_builder.dart';

import 'package:portfolio/src/models/technology/technology_model.dart';

import 'package:portfolio/src/repositories/technologies_repository.dart';

import 'package:portfolio/src/screens/home_screen/body_content_widget/technologies_section_widget/technologies_component_widget.dart';

import 'package:portfolio/src/widgets/section_header_widget.dart';

class TechnologiesSectionWidget extends StatefulWidget {
  const TechnologiesSectionWidget({super.key});

  @override
  State<TechnologiesSectionWidget> createState() =>
      _TechnologiesSectionWidgetState();
}

class _TechnologiesSectionWidgetState extends State<TechnologiesSectionWidget> {
  final technologiesRepository = TechnologiesRepository();
  final snapshotWidgetBuilder = SnapshotWidgetBuilder();

  Future<List<Object>> fetchData() async {
    return await technologiesRepository.readTechnologies();
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
        const sectionTitle = 'Tecnologias';
        final sectionType = sectionTitle.toLowerCase();
        const imageName = 'technologies';

        Widget contentWidget(List<dynamic> data) {
          final technologies = data as List<TechnologyModel>;
          final List<TechnologyModel> knownTechnologies =
              technologies.where((technology) {
            return technology.status == 'using';
          }).toList();
          final List<TechnologyModel> plannedTechnologies =
              technologies.where((technology) {
            return technology.status == 'planned';
          }).toList();

          final sectionTechnologiesDescription =
              sectionDescriptionsContant.technologies;

          return Column(
            children: [
              const SectionHeaderWidget(
                sectionName: sectionTitle,
                imageName: imageName,
              ),
              const SizedBox(height: 20.0),
              TechnologiesComponentWidget(
                description: sectionTechnologiesDescription.knownTechnologies,
                technologies: knownTechnologies,
              ),
              const SizedBox(height: 30.0),
              TechnologiesComponentWidget(
                description: sectionTechnologiesDescription.plannedTechnologies,
                technologies: plannedTechnologies,
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
