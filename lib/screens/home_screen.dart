import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:ionicons/ionicons.dart';
import 'package:morad_task_tracker/constants/color_palette.dart';
import 'package:morad_task_tracker/custom_widgets/my_textfield.dart';
import 'package:morad_task_tracker/screens/tasks_screen.dart';
import 'package:morad_task_tracker/services/projects_service.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final ProjectsService projs = ProjectsService();
  final TextEditingController projNameController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () => _showModal(),
        child: const Icon(Icons.add),
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const SizedBox(height: 10),
              StreamBuilder<QuerySnapshot>(
                stream: projs.getProjectsStream(),
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return const Center(child: CircularProgressIndicator());
                  }
                  if (snapshot.hasData) {
                    List projectsLists = snapshot.data!.docs;
                    return Expanded(
                      child: ListView.builder(
                        shrinkWrap: true,
                        itemCount: projectsLists.length,
                        itemBuilder: (context, index) {
                          DocumentSnapshot document = projectsLists[index];
                          String docID = document.id;
                          Map<String, dynamic> data =
                              document.data() as Map<String, dynamic>;
                          String projectName = data['project_name'];
                          return Padding(
                            padding: const EdgeInsets.all(5),
                            child: InkWell(
                              onTap: () =>
                                  Navigator.of(context).push(MaterialPageRoute(
                                builder: (context) =>
                                    TasksScreen(documetID: docID),
                              )),
                              child: Container(
                                height: 50,
                                width: double.infinity,
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(10),
                                    color: Theme.of(context).brightness ==
                                            Brightness.dark
                                        ? ColorPalette().lightGrey
                                        : ColorPalette().lightGreyLight),
                                child: Padding(
                                  padding: const EdgeInsets.all(10),
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text(
                                        projectName,
                                        style: const TextStyle(fontSize: 20),
                                      ),
                                      const SizedBox(width: 10),
                                      InkWell(
                                        onTap: () => _showModal(docID: docID),
                                        child: const Icon(
                                          Icons.edit,
                                          color: Colors.orange,
                                        ),
                                      ),
                                      const SizedBox(width: 10),
                                      InkWell(
                                        onTap: () => projs.deleteProject(docID),
                                        child: const Icon(
                                          Icons.delete,
                                          color: Colors.orange,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          );
                        },
                      ),
                    );
                  } else {
                    return const Text('No Data');
                  }
                },
              )
            ],
          ),
        ),
      ),
    );
  }

  void _showModal({String? docID}) {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: const Text('Add a Project'),
          content: Padding(
            padding: const EdgeInsets.all(10),
            child: MyTextField(
              controller: projNameController,
              hintText: 'project name',
              icon: Ionicons.document,
              onSubmit: () {
                if (docID != null) {
                  projs.updateProject(
                      projId: docID, projectName: projNameController.text);
                } else {
                  projs.addProject(projectName: projNameController.text);
                }

                projNameController.clear();
                Navigator.of(context).pop();
              },
            ),
          ),
        );
      },
    );
  }
}
