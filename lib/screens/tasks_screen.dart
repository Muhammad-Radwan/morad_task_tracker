import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:morad_task_tracker/constants/color_palette.dart';
import 'package:morad_task_tracker/models/task.dart';
import 'package:morad_task_tracker/services/tasks_service.dart';

class TasksScreen extends StatefulWidget {
  final String documetID;
  const TasksScreen({required this.documetID, super.key});

  @override
  State<TasksScreen> createState() => _TasksScreenState();
}

class _TasksScreenState extends State<TasksScreen> {
  final tasksServs = TasksService();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () => addNewTask(),
        child: const Icon(Icons.add),
      ),
      body: Padding(
        padding: const EdgeInsets.all(10),
        child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              StreamBuilder<QuerySnapshot>(
                stream: tasksServs.getTasksStream(widget.documetID),
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return const Center(child: CircularProgressIndicator());
                  }
                  if (snapshot.hasData) {
                    List tasksList = snapshot.data!.docs;
                    return Expanded(
                      child: ListView.builder(
                        itemCount: tasksList.length,
                        itemBuilder: (context, index) {
                          DocumentSnapshot document = tasksList[index];
                          String docID = document.id;
                          Task currentTask = Task.fromFirebase(
                              document.data() as Map<String, dynamic>);
                          return Padding(
                            padding: const EdgeInsets.all(10),
                            child: Container(
                              height: 150,
                              width: double.infinity,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10),
                                  color: Theme.of(context).brightness ==
                                          Brightness.dark
                                      ? ColorPalette().lightGrey
                                      : ColorPalette().lightGreyLight),
                              child: Padding(
                                padding: const EdgeInsets.all(10),
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Text(
                                        style: const TextStyle(fontSize: 16),
                                        'START TIME: ${currentTask.start_time?.toDate()}'),
                                    Text(
                                        style: const TextStyle(fontSize: 16),
                                        'FINISH TIME: ${currentTask.finish_time?.toDate()}'),
                                    Text(
                                        style: const TextStyle(fontSize: 16),
                                        'DURATION: ${_getDurationDifference(start: currentTask.start_time, finish: currentTask.finish_time)} MINUTES'),
                                    const SizedBox(height: 5),
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        MaterialButton(
                                            color: Colors.orange,
                                            onPressed: () =>
                                                updateTaskFinishTime(
                                                    docID: docID),
                                            child: const Text('Finish Task')),
                                        MaterialButton(
                                            color: Colors.red,
                                            child: const Text('Delete Task'),
                                            onPressed: () =>
                                                tasksServs.deleteTask(docID)),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          );
                        },
                      ),
                    );
                  } else {
                    return const Text('no data');
                  }
                },
              )
            ]),
      ),
    );
  }

  String _getDurationDifference({Timestamp? start, Timestamp? finish}) {
    DateTime startDate = start!.toDate();
    DateTime finishDate = finish!.toDate();

    Duration difference = finishDate.difference(startDate);

    return difference.inMinutes.toString();
  }

  void addNewTask() {
    tasksServs.addTask(Task(
        start_time: Timestamp.now(),
        finish_time: Timestamp.now(),
        proj_id: widget.documetID));
  }

  void updateTaskFinishTime({required String docID}) {
    tasksServs.updateTask(projId: docID, finishTime: Timestamp.now());
  }
}
