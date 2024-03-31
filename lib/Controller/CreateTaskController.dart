import 'package:flutter/material.dart';
import 'package:to_do_list/Controller/TaskProvider.dart';
import 'package:to_do_list/Model/Task.dart';

String? validateTaskName(String? value) {
  if (value!.isEmpty) {
    return 'Please enter a task name';
  }
  return null;
}

String? validateTaskDescription(String? value) {
  if (value!.isEmpty) {
    return 'Please enter a task description';
  }
  return null;
}

void createTask(GlobalKey<FormState> _key,
    {required String? title,
    required String? description,
    required TaskProvider provider,
    required BuildContext context}) {
  if (_key.currentState!.validate()) {
    _key.currentState!.save();
    if (title != null && description != null) {
      print(title);
      Task  task = Task(title: title, description: description) ;
      provider.addTask(task);
      Navigator.pop(context);

    }
  }
}
