import 'package:cloud_firestore/cloud_firestore.dart';

import 'package:portfolio/src/models/social_media_model.dart';

class SocialMediaRepository {
  final _db = FirebaseFirestore.instance;

  Future<List<SocialMediaModel>> readSocialMedia() async {
    try {
      final socialMediaList = _db
          .collection('social_media')
          .withConverter(
            fromFirestore: (snapshot, options) {
              return SocialMediaModel.fromMap(snapshot.data()!);
            },
            toFirestore: (socialMedia, options) {
              return socialMedia.toMap();
            },
          )
          .get()
          .then((querySnapshot) {
            return querySnapshot.docs.map((documentSnapshot) {
              return documentSnapshot.data();
            }).toList();
          });

      return socialMediaList;
    } catch (err) {
      return [];
    }
  }
}
