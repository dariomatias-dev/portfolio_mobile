import 'package:cloud_firestore/cloud_firestore.dart';

import 'package:portfolio/src/models/technology_name_model.dart';

class TechnologieNamesRepository {
  final _db = FirebaseFirestore.instance;

  Future<List<TechnologyNameModel>> readTechnologie() async {
    try {
      final technologiesList = _db
          .collection('technologies')
          .withConverter(
            fromFirestore: (snapshot, options) {
              return TechnologyNameModel.fromMap(snapshot.data()!);
            },
            toFirestore: (technologieName, options) {
              return technologieName.toMap();
            },
          )
          .get()
          .then((querySnapshot) {
            return querySnapshot.docs.map((documentSnapshot) {
              return documentSnapshot.data();
            }).toList();
          });

      return technologiesList;
    } catch (e) {
      return [];
    }
  }
}
