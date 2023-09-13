import 'package:portfolio/src/models/section_descriptions/section_descriptions_technologies_model.dart';

class SectionDescriptionsModel {
  SectionDescriptionsModel({
    required this.projects,
    required this.technologies,
    required this.contacts,
  });

  final String projects;
  final String contacts;
  final SectionDescriptionsTechnologiesModel technologies;
}
