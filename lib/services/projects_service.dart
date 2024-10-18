import 'package:cloud_firestore/cloud_firestore.dart';

class ProjectsService {
  // * init
  CollectionReference projects =
      FirebaseFirestore.instance.collection('projects');
  // * create
  void addProject({required String projectName}) {
    projects.add({'project_name': projectName});
  }

  // * read
  Stream<QuerySnapshot> getProjectsStream() {
    return projects.orderBy('project_name').snapshots();
  }

  // * update
  void updateProject({required String projId, required String projectName}) {
    projects.doc(projId).update({'project_name': projectName});
  }

  // * delete
  void deleteProject(String projId) {
    projects.doc(projId).delete();
  }
}
