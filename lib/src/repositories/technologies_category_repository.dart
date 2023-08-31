import 'package:cloud_firestore/cloud_firestore.dart';

import 'package:portfolio/src/models/technologies_category_model.dart';

class TechnologiesCategoryRepository {
  final _db = FirebaseFirestore.instance;

  Future<List<String>> readTechnologiesStatus() async {
    try {
      final technologieStatusList = _db
          .collection('technologies_status')
          .withConverter(
            fromFirestore: (snapshot, options) {
              return TechnologiesCategoryModel.fromMap(snapshot.data()!);
            },
            toFirestore: (technologieStatus, options) {
              return technologieStatus.toMap();
            },
          )
          .get()
          .then((querySnapshot) {
            return querySnapshot.docs.map((documentSnapshot) {
              return documentSnapshot.data().description;
            }).toList();
          });

      return technologieStatusList;
    } catch (err) {
      return [];
    }
  }
}
