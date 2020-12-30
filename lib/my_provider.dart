import 'package:flutter/material.dart';
import 'package:providerassignment/db_helper.dart';
import 'package:providerassignment/task_model.dart';

class MyProvider extends ChangeNotifier {
  List task = [];

  Future selectAllTask() async {
    try {
      List result = await DBHelper.dbHelper.selectAllTask();
      task = result.map((e) => Task.fromJson(e)).toList();
      notifyListeners();
    } on Exception catch (e) {
      print(e);
    }
  }

  insertNewTask(Task task) async {
    try {
      await DBHelper.dbHelper.insertNewTask(task);
      notifyListeners();
    } on Exception catch (e) {
      print(e);
    }
  }

  updateTask(Task task) async {
    try {
      await DBHelper.dbHelper.updateTask(task);
      notifyListeners();
    } on Exception catch (e) {
      print(e);
    }
  }

  deleteTask(Task task) async {
    try {
      await DBHelper.dbHelper.deleteTask(task);
      notifyListeners();
    } on Exception catch (e) {
      print(e);
    }
  }

  Future<List<Task>> selectSpecificTask(int isComplete) async {
    try {
      List result = await DBHelper.dbHelper.selectSpecificTask(isComplete);
      task = result.map((e) => Task.fromJson(e)).toList();
      notifyListeners();
    } on Exception catch (e) {
      print(e);
    }
  }
}
