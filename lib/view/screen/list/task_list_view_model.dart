import 'dart:async';

import 'package:todo_app_flutter/application.dart';
import 'package:todo_app_flutter/data/in_memory_database.dart';
import 'package:todo_app_flutter/data/model/task_entity.dart';

class TaskListViewModel {
  final InMemoryDatabase _database = Application.database;
  StreamController<List<Task>> tasks = StreamController();

  void refreshTasks() {
    tasks.add(_database.getTasks());
  }
}
