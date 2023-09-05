import 'package:cloud_firestore/cloud_firestore.dart';

import 'package:portfolio/src/models/technology/technology_model.dart';

class TechnologiesRepository {
  final _db = FirebaseFirestore.instance;

  Future<List<TechnologyModel>?> readTechnologies() async {
    try {
      final technologiesList = _db
          .collection('technologies')
          .withConverter(
            fromFirestore: (snapshot, options) {
              return TechnologyModel.fromMap(snapshot.data()!);
            },
            toFirestore: (technology, options) {
              return technology.toMap();
            },
          )
          .get()
          .then((querySnapshot) {
            return querySnapshot.docs.map((documentSnapshot) {
              return documentSnapshot.data();
            }).toList();
          });

      return technologiesList;
    } catch (err) {
      return null;
    }
  }
}
