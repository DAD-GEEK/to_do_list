import 'package:flutter/material.dart';
import 'package:to_do_list/Controller/TaskProvider.dart';
import 'package:provider/provider.dart';
import 'package:to_do_list/Model/Task.dart';
import 'package:to_do_list/view/pages/CreateTaskPage.dart';

class ListTaskPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Consumer<TaskProvider>(
        builder: (context, taskProvider, child) {
          return listTask(taskProvider);
        },
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.lightBlueAccent,
        onPressed: () => loadCreatetaskPage(context),
        child: const Icon(Icons.add),
      ),
    );
  }

  ListView listTask(TaskProvider taskProvider) {
    List<Task> tasks = taskProvider.tasks;
    return ListView.builder(
      itemCount: tasks.length,
      itemBuilder: (context, index) {
        return ListTile(
          title: Text(tasks[index].title),
          subtitle: Text(tasks[index].description),
        );
      },
    );
  }

  loadCreatetaskPage(BuildContext context) {
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (context) => CreateTaskPage(),
      ),
    );
  }
}
