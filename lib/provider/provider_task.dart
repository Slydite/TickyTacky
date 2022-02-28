import 'dart:collection';
import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '/widgets/shared_pref_helper.dart';
import '/models/item.dart';

class TaskItems with ChangeNotifier {
  List<Items> taskList = [
    Items(title: 'You can scroll the task to view it', time: ''),
    Items(title: 'Add more tasks by pressing the floating button', time: ''),
    Items(title: 'Tap on the circle to mark/unmark as done', time: ''),
    Items(title: 'Long press a Task to delete it', time: ''),
  ];

  SharedPreferences? sharedPreferences;

  UnmodifiableListView<Items> get allcategories =>
      UnmodifiableListView(taskList);

  void addTask(Items item) {
    taskList.add(item);
    saveTaskToLocalStorage();
    notifyListeners();
  }

  void deleteTask(Items item) {
    taskList.remove(item);
    updateTaskToLocalStorage();
    notifyListeners();
  }

  void initSharedPreferences() async {
    await SharedPreferencesHelper.init();
    sharedPreferences = SharedPreferencesHelper.instance;
    loadTaskFromLocalStorage();
    notifyListeners();
  }

  void saveTaskToLocalStorage() {
    List<String>? spList =
        taskList.map((item) => json.encode(item.toMap())).toList();
    sharedPreferences!.setStringList('categorylist', spList);
  }

  void loadTaskFromLocalStorage() {
    List<String>? spList = sharedPreferences!.getStringList('categorylist');
    if (spList != null) {
      taskList =
          spList.map((item) => Items.fromMap(json.decode(item))).toList();
    }
  }

  void updateTaskToLocalStorage() {
    sharedPreferences!.remove('categorylist');
    saveTaskToLocalStorage();
  }
}
