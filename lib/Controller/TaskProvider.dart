import 'package:flutter/material.dart';
import 'package:to_do_list/Model/Task.dart';

class TaskProvider extends ChangeNotifier{
  List<Task> _tasks = [];
  List<Task> get tasks => _tasks;

  void addTask(Task task){
    _tasks.add(task);
    notifyListeners();
  }

  void removeTask(Task task){
    _tasks.remove(task);
    notifyListeners();
  }

  void deleteTask(int index) {
    _tasks.removeAt(index);
    notifyListeners();
  }
  
}

