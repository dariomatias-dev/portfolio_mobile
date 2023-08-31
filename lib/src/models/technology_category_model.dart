import 'package:portfolio/src/models/technology_model.dart';

class TechnologiesCategoryModel {
  TechnologiesCategoryModel({
    required this.description,
    required this.technologies,
  });

  final String description;
  final List<TechnologyModel> technologies;
}
