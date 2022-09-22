import 'package:todo_app_flutter/application.dart';
import 'package:todo_app_flutter/data/in_memory_database.dart';

class TaskCreationViewModel {
  final InMemoryDatabase _database = Application.database;

  bool addTask(String content) {
    return _database.addTask(content);
  }
}
