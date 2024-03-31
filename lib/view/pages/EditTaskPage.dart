import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:to_do_list/Controller/CreateTaskController.dart';
import 'package:to_do_list/Controller/TaskProvider.dart';
import 'package:to_do_list/Model/Task.dart';
import 'package:to_do_list/view/widgets/AppBarWidget.dart';

class EditTaskPage extends StatefulWidget {
  final int index;
  const EditTaskPage({super.key, required this.index});

  @override
  State<EditTaskPage> createState() => _EditTaskPageState();
}

class _EditTaskPageState extends State<EditTaskPage> {
  final GlobalKey<FormState> _key = GlobalKey();

  @override
  Widget build(BuildContext context) {
    int index = widget.index;
    return Scaffold(
      appBar: AppBarWidget("Editar Tarea"),
      body: Consumer<TaskProvider>(
          builder: (context, taskProvider, child) => taskForm(taskProvider,index)),
    );
  }

  Form taskForm(TaskProvider taskProvider,int index) {
    List<Task> tasks = taskProvider.tasks;
    return Form(
      key: _key,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            TextFormField(
              initialValue: tasks[index].title,
              decoration: const InputDecoration(labelText: "Title"),
              validator: validateTaskName,
              onChanged: (value) => tasks[index].title = value,
            ),
            TextFormField(
              initialValue: tasks[index].description,
              decoration: const InputDecoration(labelText: "Description"),
              validator: validateTaskDescription,
              onChanged: (value) => tasks[index].description = value,
            ),
            ElevatedButton(
              style: ButtonStyle(
                backgroundColor:
                    MaterialStateProperty.all<Color>(Colors.lightBlueAccent),
              ),
              child: const Text("Guardar", style: TextStyle(color: Colors.black)),
              onPressed: () => editTask(_key,
                  title: tasks[index].title,
                  description: tasks[index].description,
                  provider: taskProvider,
                  context: context,
                  index: index),
            )
          ],
        ),
      ),
    );
  }
}
