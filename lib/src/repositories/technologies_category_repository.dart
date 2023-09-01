import 'package:cloud_firestore/cloud_firestore.dart';

import 'package:portfolio/src/models/technologies_category_model.dart';

class TechnologiesCategoryRepository {
  final _db = FirebaseFirestore.instance;

  Future<List<String>> readTechnologiesStatus() async {
    try {
      final technologiesCategoriesList = _db
          .collection('technologies_categories')
          .withConverter(
            fromFirestore: (snapshot, options) {
              return TechnologiesCategoryModel.fromMap(snapshot.data()!);
            },
            toFirestore: (technologieCategory, options) {
              return technologieCategory.toMap();
            },
          )
          .get()
          .then((querySnapshot) {
            return querySnapshot.docs.map((documentSnapshot) {
              return documentSnapshot.data().description;
            }).toList();
          });

      return technologiesCategoriesList;
    } catch (err) {
      return [];
    }
  }
}
