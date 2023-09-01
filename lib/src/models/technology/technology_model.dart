import 'package:portfolio/src/models/technology/technology_image_name_model.dart';
import 'package:portfolio/src/models/technology/technology_links_model.dart';

class TechnologyModel {
  TechnologyModel({
    required this.name,
    required this.description,
    required this.gradient,
    required this.imageName,
    required this.status,
    required this.createdIn,
    required this.createdBy,
    required this.links,
  });

  final String name;
  final String description;
  final List<String> gradient;
  final TechnologieImageNameModel imageName;
  final String status;
  final String createdIn;
  final String createdBy;
  final TechnologieLinksModel links;

  factory TechnologyModel.fromMap(Map<String, dynamic> map) {
    return TechnologyModel(
      name: map['name'],
      description: map['description'],
      gradient: (map['gradient'] as List<dynamic>).cast<String>(),
      imageName: TechnologieImageNameModel.fromMap(map['image_name']),
      status: map['status'],
      createdIn: map['created_in'],
      createdBy: map['created_by'],
      links: TechnologieLinksModel.fromMap(map['links']),
    );
  }

  toMap() {
    return {
      'name': name,
      'description': description,
      'gradient': gradient,
      'imageName': imageName.toMap(),
      'status': status,
      'createdIn': createdIn,
      'createdBy': createdBy,
      'links': links.toMap(),
    };
  }
}
