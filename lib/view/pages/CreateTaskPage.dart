import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:to_do_list/Controller/TaskController.dart';
import 'package:to_do_list/Controller/TaskProvider.dart';
import 'package:to_do_list/view/widgets/AppBarWidget.dart';

class CreateTaskPage extends StatefulWidget {
  @override
  State<CreateTaskPage> createState() => _CreatetaskPageState();
}

class _CreatetaskPageState extends State<CreateTaskPage> {
  GlobalKey<FormState> _key = GlobalKey();

  String? title = "";
  String? description = "";
  TaskController _taskController = TaskController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBarWidget("Nueva Tarea"),
      body: Consumer<TaskProvider>(
          builder: (context, taskProvider, child) => taskForm(taskProvider)),
    );
  }

  Form taskForm(TaskProvider taskProvider) {
    return Form(
      key: _key,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            TextFormField(
              decoration: const InputDecoration(labelText: "Titulo"),
              validator: validateTaskName,
              onChanged: (value) => title = value,
            ),
            TextFormField(
              decoration: const InputDecoration(labelText: "Descripción"),
              validator: validateTaskDescription,
              onChanged: (value) => description = value,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ElevatedButton(
                  style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all<Color>(
                        Colors.lightBlueAccent),
                        
                  ),
                  child: const Text("Aceptar",
                      style: TextStyle(color: Colors.black)),
                  onPressed: () => _taskController.createTask(_key,
                      title: title,
                      description: description,
                      provider: taskProvider,
                      context: context),
                ),
                ElevatedButton(
                  style: ButtonStyle(
                    backgroundColor:
                        MaterialStateProperty.all<Color>(Colors.redAccent),
                  ),
                  child: const Text("Cancelar",
                      style: TextStyle(color: Colors.white)),
                  onPressed: () => Navigator.of(context).pop(),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
