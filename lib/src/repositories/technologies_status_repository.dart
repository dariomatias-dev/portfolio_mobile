import 'package:cloud_firestore/cloud_firestore.dart';

import 'package:portfolio/src/models/technologies_status_model.dart';

class TechnologiesStatusRepository {
  final _db = FirebaseFirestore.instance;

  Future<List<TechnologieStatusModel>> readTechnologiesStatus() async {
    try {
      final technologieStatusList = _db
          .collection('technologies_status')
          .withConverter(
            fromFirestore: (snapshot, options) {
              return TechnologieStatusModel.fromMap(snapshot.data()!);
            },
            toFirestore: (technologieStatus, options) {
              return technologieStatus.toMap();
            },
          )
          .get()
          .then((querySnapshot) {
            return querySnapshot.docs.map((documentSnapshot) {
              return documentSnapshot.data();
            }).toList();
          });

      return technologieStatusList;
    } catch (err) {
      return [];
    }
  }
}
