import 'package:flutter/material.dart';

import 'package:portfolio/src/core/constants/section_descriptions_constant.dart';
import 'package:portfolio/src/core/ui/widgets/section_data_unavailable_widget.dart';

import 'package:portfolio/src/models/technology/technology_model.dart';

import 'package:portfolio/src/providers/data_provider_inherited_widget.dart';

import 'package:portfolio/src/screens/home_screen/components/body_content_widget/technologies_section_widget/technologies_component_widget.dart';

import 'package:portfolio/src/widgets/section_header_widget.dart';

class TechnologiesSectionWidget extends StatefulWidget {
  const TechnologiesSectionWidget({super.key});

  @override
  State<TechnologiesSectionWidget> createState() =>
      _TechnologiesSectionWidgetState();
}

class _TechnologiesSectionWidgetState extends State<TechnologiesSectionWidget> {
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
    final List<TechnologyModel>? studyingTechnologies =
        technologies?.where((technology) {
      return technology.status == 'studying';
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
              if (studyingTechnologies != null || plannedTechnologies != null)
                const SizedBox(height: 30.0),
              if (studyingTechnologies != null)
                TechnologiesComponentWidget(
                  description:
                      sectionTechnologiesDescription.studyingTechnologies,
                  technologies: studyingTechnologies,
                ),
              if (studyingTechnologies != null && plannedTechnologies != null)
                const SizedBox(height: 30.0),
              if (plannedTechnologies != null)
                TechnologiesComponentWidget(
                  description:
                      sectionTechnologiesDescription.plannedTechnologies,
                  technologies: plannedTechnologies,
                ),
            ],
          );
  }
}
