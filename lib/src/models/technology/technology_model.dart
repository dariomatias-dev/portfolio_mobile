import 'package:portfolio/src/models/technology/technology_image_name_model.dart';
import 'package:portfolio/src/models/technology/technology_references_model.dart';

class TechnologyModel {
  TechnologyModel({
    required this.name,
    required this.description,
    required this.imageName,
    required this.status,
    this.userCompanies,
    this.userApplications,
    required this.createdBy,
    required this.releasedIn,
    required this.references,
  });

  final String name;
  final String description;
  final TechnologyImageNameModel imageName;
  final String status;
  final String? userCompanies;
  final String? userApplications;
  final String createdBy;
  final String releasedIn;
  final TechnologyReferencesModel references;

  factory TechnologyModel.fromMap(Map<String, dynamic> map) {
    return TechnologyModel(
      name: map['name'],
      description: map['description'],
      imageName: TechnologyImageNameModel.fromMap(map['image_name']),
      status: map['status'],
      userCompanies: map['user_companies'],
      userApplications: map['user_applications'],
      createdBy: map['created_by'],
      releasedIn: map['released_in'],
      references: TechnologyReferencesModel.fromMap(map['references']),
    );
  }

  toMap() {
    return {
      'name': name,
      'description': description,
      'imageName': imageName.toMap(),
      'status': status,
      'userCompanies': userCompanies,
      'userApplications': userApplications,
      'createdBy': createdBy,
      'releasedIn': releasedIn,
      'references': references.toMap(),
    };
  }
}
