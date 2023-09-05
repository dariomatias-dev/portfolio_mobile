import 'package:cloud_firestore/cloud_firestore.dart';

import 'package:portfolio/src/models/profile_model.dart';

class ProfileRepository {
  final _db = FirebaseFirestore.instance;

  Future<ProfileModel> readProfile() async {
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
            return querySnapshot.docs[0].data();
          });

      return profile;
    } catch (err) {
      return Future.value(
        ProfileModel(
          name: '',
          description: '',
          email: '',
          location: '',
        ),
      );
    }
  }
}
