import 'package:cloud_firestore/cloud_firestore.dart';

import 'package:portfolio/src/models/contact_model.dart';

class ContactsService {
  final _db = FirebaseFirestore.instance;

  Future<List<ContactModel>?> readContacts() async {
    try {
      final contactsList = _db
          .collection('contacts')
          .withConverter(
            fromFirestore: (snapshot, options) {
              return ContactModel.fromMap(snapshot.data()!);
            },
            toFirestore: (contact, options) {
              return contact.toMap();
            },
          )
          .get()
          .then((querySnapshot) {
            return querySnapshot.docs.map((documentSnapshot) {
              return documentSnapshot.data();
            }).toList();
          });

      return contactsList;
    } catch (err) {
      return null;
    }
  }
}
