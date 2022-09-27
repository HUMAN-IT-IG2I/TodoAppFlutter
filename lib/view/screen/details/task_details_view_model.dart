import 'package:todo_app_flutter/data/in_memory_database.dart';
import 'package:todo_app_flutter/data/model/task_entity.dart';

import '../../../application.dart';

class TaskDetailsViewModel {
  final InMemoryDatabase _database = Application.database;

  Task? _task;

  Task? retrieveTask(int taskId) {
    _task = _database.getById(taskId);
    return _task;
  }

  void markTaskAsDone() {
    _database.markAsDone(_task!);
  }
}
