import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:to_do_list/Controller/TaskProvider.dart';
import 'package:provider/provider.dart';
import 'package:to_do_list/Model/Task.dart';
import 'package:to_do_list/view/pages/CreateTaskPage.dart';
import 'package:to_do_list/view/pages/EditTaskPage.dart';

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
          leading: Checkbox(
            value: tasks[index].isDone,
            onChanged: (value) => taskProvider.toggleTask(index),
          ),
          title: Text(
            tasks[index].title,
            style: TextStyle(
                decoration:
                    tasks[index].isDone ? TextDecoration.lineThrough : null),
          ),
          subtitle: Text(tasks[index].description,
            style: TextStyle(
                decoration:
                    tasks[index].isDone ? TextDecoration.lineThrough : null),
          ),
          trailing: SizedBox(
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                IconButton(
                  icon: const Icon(Icons.edit),
                  onPressed: () => loadEditTaskPage(context, index),
                ),
                IconButton(
                  icon: const Icon(Icons.delete),
                  onPressed: () => taskProvider.deleteTask(index),
                ),
              ],
            ),
          ),
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

  loadEditTaskPage(BuildContext context, int index) {
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (context) => EditTaskPage(index: index),
      ),
    );
  }
}
