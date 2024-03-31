import 'package:flutter/material.dart';
import 'package:to_do_list/Model/Task.dart';

class TaskProvider extends ChangeNotifier{
  final List<Task> _tasks = [];
  List<Task> get tasks => _tasks;


  void addTask(Task task){
    _tasks.add(task);
    notifyListeners();
  }
  void deleteTask(int index) {
    _tasks.removeAt(index);
    notifyListeners();
  }

  void editTask(int index, Task task){
    _tasks[index] = task;
    notifyListeners();
  }

  toggleTask(int index) {
    _tasks[index].isDone = !_tasks[index].isDone;
    notifyListeners();
  }
  
}

