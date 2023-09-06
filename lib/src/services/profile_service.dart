import 'package:cloud_firestore/cloud_firestore.dart';

import 'package:portfolio/src/models/profile_model.dart';

class ProfileService {
  final _db = FirebaseFirestore.instance;

  Future<ProfileModel?> readProfile() async {
    try {
      final profile = _db
          .collection('profiles')
          .withConverter(
            fromFirestore: (snapshot, options) {
              return ProfileModel.fromMap(snapshot.data()!);
            },
            toFirestore: (profile, options) {
              return profile.toMap();
            },
          )
          .get()
          .then((querySnapshot) {
            final docs = querySnapshot.docs;

            return docs.isNotEmpty ? docs[0].data() : null;
          });

      return profile;
    } catch (err) {
      return null;
    }
  }
}
