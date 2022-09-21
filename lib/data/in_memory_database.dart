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

  List<Task> getTasks() {
    return _tasks.where((task) => task.isActive).toList(growable: false);
  }
}
