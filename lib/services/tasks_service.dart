import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:morad_task_tracker/models/task.dart';

class TasksService {
  // * init
  CollectionReference tasks = FirebaseFirestore.instance.collection('tasks');

  // * create
  void addTask(Task task) {
    tasks.add(
      task.toFirebaseDocument(),
    );
  }

  // * read by doc id
  Stream<QuerySnapshot> getTasksStream(String docID) {
    return tasks.where('proj_id', isEqualTo: docID).snapshots();
  }

  // * update
  void updateTask({required String projId, required Timestamp finishTime}) {
    tasks.doc(projId).update({'finish_time': finishTime});
  }

  // * delete
  void deleteTask(String taskId) {
    tasks.doc(taskId).delete();
  }
}
