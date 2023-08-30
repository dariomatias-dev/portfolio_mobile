import 'package:cloud_firestore/cloud_firestore.dart';

import 'package:portfolio/src/models/technology_name_model.dart';

class TechnologieNamesRepository {
  final _db = FirebaseFirestore.instance;

  Future<List<TechnologyNameModel>> readTechnologie() async {
    
  }
}
