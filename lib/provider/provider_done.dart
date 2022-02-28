import 'dart:collection';
import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '/widgets/shared_pref_helper.dart';
import '/models/item.dart';

class DoneItems with ChangeNotifier {
  List<Items> doneList = [];

  SharedPreferences? sharedPreferences2;

  UnmodifiableListView<Items> get allcategories =>
      UnmodifiableListView(doneList);

  void addDone(Items item) {
    doneList.add(item);
    saveDoneToLocalStorage();
    notifyListeners();
  }

  void deleteDone(Items item) {
    doneList.remove(item);
    updateDoneToLocalStorage();
    notifyListeners();
  }

  void initSharedPreferences() async {
    await SharedPreferencesHelper.init();
    sharedPreferences2 = SharedPreferencesHelper.instance;
    loadDoneFromLocalStorage();
    notifyListeners();
  }

  void saveDoneToLocalStorage() {
    List<String>? spList2 =
        doneList.map((item) => json.encode(item.toMap())).toList();
    sharedPreferences2!.setStringList('donelist', spList2);
  }

  void loadDoneFromLocalStorage() {
    List<String>? spList2 = sharedPreferences2!.getStringList('donelist');
    if (spList2 != null) {
      doneList =
          spList2.map((item) => Items.fromMap(json.decode(item))).toList();
    }
  }

  void updateDoneToLocalStorage() {
    sharedPreferences2!.remove('donelist');
    saveDoneToLocalStorage();
  }
}
