// ignore_for_file: non_constant_identifier_names

import 'package:cloud_firestore/cloud_firestore.dart';

class Task {
  String? proj_id;
  Timestamp? start_time;
  Timestamp? finish_time;

  Task({
    this.proj_id,
    this.start_time,
    this.finish_time,
  });

  factory Task.fromFirebase(Map<String, dynamic> firebaseDocument) {
    return Task(
      proj_id: firebaseDocument['proj_id'],
      start_time: firebaseDocument['start_time'],
      finish_time: firebaseDocument['finish_time'],
    );
  }

  Map<String, dynamic> toFirebaseDocument() {
    return {
      'proj_id': proj_id,
      'start_time': start_time,
      'finish_time': finish_time,
    };
  }
}
