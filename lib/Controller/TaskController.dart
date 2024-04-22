import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:to_do_list/Controller/TaskProvider.dart';
import 'package:to_do_list/Model/Task.dart';

class TaskController {

  FirebaseFirestore db = FirebaseFirestore.instance;
  final String collection = 'tasks';

  Future<String?> createTask(GlobalKey<FormState> _key,
    {required String? title,
    required String? description,
    required TaskProvider provider,
    required BuildContext context}) async {
  try {
    if (_key.currentState!.validate()) {
      _key.currentState!.save();
      if (title != null && description != null) {
        Task task = Task(title: title, description: description);
        provider.addTask(task);
        await db.collection(collection).add(task.toMap());
        Navigator.pop(context);
        return 'Task created';
      }
    }
  } catch (e) {
    print(e);
    return '';
  }
}
  
}

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



void editTask(GlobalKey<FormState> _key,
    {required String? title,
    required String? description,
    required TaskProvider provider,
    required BuildContext context,
    required int index}) {
  if (_key.currentState!.validate()) {
    _key.currentState!.save();
    if (title != null && description != null) {
      Task task = Task(title: title, description: description);
      provider.editTask(index, task);
      Navigator.pop(context);
    }
  }
}
