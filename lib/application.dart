import 'package:flutter/material.dart';
import 'package:todo_app_flutter/data/in_memory_database.dart';
import 'package:todo_app_flutter/view/screen/create/task_creation_screen.dart';
import 'package:todo_app_flutter/view/screen/details/task_details_screen.dart';
import 'package:todo_app_flutter/view/screen/list/task_list_screen.dart';

class Application extends StatelessWidget {
  static final InMemoryDatabase database = InMemoryDatabase();

  static String get creationDestination => '/creation';

  static String get detailsDestination => '/details';

  static String get listDestination => '/';

  const Application({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Startup Name Generator',
      initialRoute: listDestination,
      routes: {
        listDestination: (context) => const TaskListScreen(),
        creationDestination: (context) => const TaskCreationScreen(),
        detailsDestination: (context) => const TaskDetailsScreen(),
      },
    );
  }
}
