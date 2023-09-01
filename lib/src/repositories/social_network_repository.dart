import 'package:cloud_firestore/cloud_firestore.dart';

import 'package:portfolio/src/models/social_network_model.dart';

class SocialNetworkRepository {
  final _db = FirebaseFirestore.instance;

  Future<List<SocialNetworkModel>> readSocialNetworks() async {
    try {
      final socialNetworksList = _db
          .collection('social_networks')
          .withConverter(
            fromFirestore: (snapshot, options) {
              return SocialNetworkModel.fromMap(snapshot.data()!);
            },
            toFirestore: (socialNetwork, options) {
              return socialNetwork.toMap();
            },
          )
          .get()
          .then((querySnapshot) {
            return querySnapshot.docs.map((documentSnapshot) {
              return documentSnapshot.data();
            }).toList();
          });

      return socialNetworksList;
    } catch (err) {
      return [];
    }
  }
}
