import 'dart:collection';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:it/models/task-model.dart';
import 'package:provider/provider.dart';

class TaskProviderList extends ChangeNotifier {
  List<TaskModelDay3> _items = [];
  UnmodifiableListView<TaskModelDay3> get items => UnmodifiableListView(_items);

  void setItems(var itemsFromFirebase, BuildContext context) {
    final List<TaskModelDay3> data = [];
    itemsFromFirebase.forEach((e) => {data.add(TaskModelDay3(id: e['id'], title: e['title'], isDone: e['isDone'], createdDate: e['createdDate']))});
    _items = data;
    // notifyListeners();
    // we can't call notifyListeners because we calling provider in streambuilder in build method
    //لو عايزين نندلها هنضطر نشتغل ف init state or did change dependencies methods
  }

  void add(TaskModelDay3 task) {
    _items.add(task);
    //notifyListeners();
  }
}
