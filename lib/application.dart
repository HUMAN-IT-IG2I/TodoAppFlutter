import 'package:flutter/material.dart';
import 'package:todo_app_flutter/data/in_memory_database.dart';
import 'package:todo_app_flutter/view/screen/list/task_list_screen.dart';

class Application extends StatelessWidget {
  static final InMemoryDatabase database = InMemoryDatabase();

  const Application({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: 'Startup Name Generator',
      home: TaskListScreen(),
    );
  }
}
