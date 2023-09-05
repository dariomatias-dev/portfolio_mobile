import 'package:cloud_firestore/cloud_firestore.dart';

import 'package:portfolio/src/models/project/project_model.dart';

class ProjectsRepository {
  final _db = FirebaseFirestore.instance;

  Future<List<ProjectModel>?> readProjects() async {
    try {
      final projectsList = _db
          .collection('projects')
          .withConverter(
            fromFirestore: (snapshot, options) {
              return ProjectModel.fromMap(snapshot.data()!);
            },
            toFirestore: (project, options) {
              return project.toMap();
            },
          )
          .get()
          .then((querySnapshot) {
            return querySnapshot.docs.map((documentSnapshot) {
              return documentSnapshot.data();
            }).toList();
          });

      return projectsList;
    } catch (err) {
      return null;
    }
  }
}
