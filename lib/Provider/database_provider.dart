import 'package:buylist/Models/task_model.dart';
import 'package:buylist/Services/database_helper.dart';
import 'package:flutter/material.dart';

class DatabaseProvider extends ChangeNotifier {
  final DatabaseHelper databaseHelper;

  List<TaskModel> _tasks = [];
  List<TaskModel> get tasks => _tasks;

  DatabaseProvider({required this.databaseHelper}) {
    _getAllTasks();
  }

  void _getAllTasks() async {
    _tasks = await databaseHelper.getTasks();
    notifyListeners();
  }

  Future<void> addTask(TaskModel taskModel) async {
    await databaseHelper.insertTask(taskModel);
    notifyListeners();
  }

  Future<TaskModel> getTaskById(int id) async {
    return await databaseHelper.getTaskById(id);
  }

  void updateTask(TaskModel taskModel) async {
    await databaseHelper.updateTask(taskModel);
    _getAllTasks();
  }

  void deleteTask(int id) async {
    await databaseHelper.deleteTask(id);
    _getAllTasks();
  }
}
