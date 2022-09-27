import 'package:collection/collection.dart';
import 'package:todo_app_flutter/data/model/task_entity.dart';

class InMemoryDatabase {
  final List<Task> _tasks = [
    Task(
      1,
      "Describe fFlutter before benchmarking",
      DateTime.now(),
      false,
    ),
    Task(
      2,
      "Benchmark Flutter",
      DateTime.now(),
      true,
    ),
    Task(
      3,
      "Create a Todo App with Flutter",
      DateTime.now(),
      true,
    ),
  ];

  bool addTask(String content) {
    _tasks.add(Task(
      _getLastUsedId() + 1,
      content,
      DateTime.now(),
      true,
    ));
    return true;
  }

  Task? getById(int taskId) =>
      _tasks.singleWhereOrNull((task) => task.id == taskId);

  List<Task> getTasks() {
    return _tasks.where((task) => task.isActive).toList(growable: false);
  }

  void markAsDone(Task task) {
    int position = _tasks.indexWhere((t) => t.id == task.id);
    _tasks.replaceRange(position, position + 1, [
      Task(
        task.id,
        task.content,
        task.creationDate,
        false,
      )
    ]);
  }

  int _getLastUsedId() {
    List<int> ids = _tasks.map((task) => task.id).toList();
    ids.sort();
    return ids.last;
  }
}
