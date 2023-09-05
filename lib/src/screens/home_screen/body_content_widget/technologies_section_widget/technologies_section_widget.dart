import 'package:flutter/material.dart';

import 'package:portfolio/src/core/constants/section_descriptions_constant.dart';
import 'package:portfolio/src/core/ui/widgets/section_data_unavailable_widget.dart';

import 'package:portfolio/src/models/technology/technology_model.dart';

import 'package:portfolio/src/providers/data_provider_inherited_widget.dart';

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
    const sectionName = 'Tecnologias';
    const imageName = 'technologies';

    final sectionTechnologiesDescription =
        sectionDescriptionsContant.technologies;

    final technologies = DataProviderInheritedWidget.of(context)?.technologies;
    final List<TechnologyModel>? knownTechnologies =
        technologies?.where((technology) {
      return technology.status == 'using';
    }).toList();
    final List<TechnologyModel>? plannedTechnologies =
        technologies?.where((technology) {
      return technology.status == 'planned';
    }).toList();

    return technologies == null
        ? const SectionDataUnavailableWidget(
            sectionName: sectionName,
          )
        : Column(
            children: [
              const SectionHeaderWidget(
                sectionName: sectionName,
                imageName: imageName,
              ),
              const SizedBox(height: 20.0),
              TechnologiesComponentWidget(
                description: sectionTechnologiesDescription.knownTechnologies,
                technologies: knownTechnologies!,
              ),
              const SizedBox(height: 30.0),
              TechnologiesComponentWidget(
                description: sectionTechnologiesDescription.plannedTechnologies,
                technologies: plannedTechnologies!,
              ),
            ],
          );
  }
}
