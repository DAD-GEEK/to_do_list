import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:to_do_list/Controller/CreateTaskController.dart';
import 'package:to_do_list/Controller/TaskProvider.dart';
import 'package:to_do_list/Model/Task.dart';
import 'package:to_do_list/view/widgets/AppBarWidget.dart';

class CreateTaskPage extends StatefulWidget {
  @override
  State<CreateTaskPage> createState() => _CreatetaskPageState();
}

class _CreatetaskPageState extends State<CreateTaskPage> {
  GlobalKey<FormState> _key = GlobalKey();

  String? title = "";
  String? description = "";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBarWidget("New Task"),
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
              decoration: const InputDecoration(labelText: "Title"),
              validator: validateTaskName   ,
              onChanged: (value) => title = value,
            ),
            TextFormField(
              decoration: const InputDecoration(labelText: "Description"),
              validator: validateTaskDescription,
              onChanged: (value) => description = value,
            ),
            ElevatedButton(
              style: ButtonStyle(
                backgroundColor:
                    MaterialStateProperty.all<Color>(Colors.lightBlueAccent),
              ),
              child: const Text("Save", style: TextStyle(color: Colors.black)),
              onPressed: () => createTask(_key,
                  title: title,
                  description: description,
                  provider: taskProvider, context: context),
            )
          ],
        ),
      ),
    );
  }
}
