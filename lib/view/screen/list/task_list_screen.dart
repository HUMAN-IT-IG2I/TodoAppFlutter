import 'package:flutter/material.dart';
import 'package:todo_app_flutter/data/model/task_entity.dart';
import 'package:todo_app_flutter/view/screen/list/task_item.dart';
import 'package:todo_app_flutter/view/screen/list/task_list_view_model.dart';
import 'package:todo_app_flutter/view/widget/list_item.dart';

import '../../../application.dart';

class TaskListScreen extends StatefulWidget {
  const TaskListScreen({Key? key}) : super(key: key);

  @override
  State<TaskListScreen> createState() => _TaskListScreenState();
}

class _TaskListScreenState extends State<TaskListScreen> {
  late TaskListViewModel _viewModel;
  final List<Task> _task = [];

  @override
  Widget build(BuildContext context) {
    final isTaskCreated = ModalRoute.of(context)!.settings.arguments as bool?;

    if (isTaskCreated != null && isTaskCreated) {
      _viewModel.refreshTasks();
    }

    return Scaffold(
      appBar: AppBar(
        title: const Text('Your awaiting tasks'),
      ),
      body: ListView(
        children: _getListData(),
        padding: const EdgeInsets.only(top: 8.0),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          _navigateToCreation();
        },
        child: const Icon(Icons.add),
      ),
    );
  }

  @override
  void initState() {
    super.initState();
    _viewModel = TaskListViewModel();
    _viewModel.tasks.stream.listen((tasks) {
      _task.clear();
      _task.addAll(tasks);
    });
  }

  List<Widget> _getListData() {
    List<Widget> widgets = [];
    for (Task task in Application.database.getTasks()) {
      widgets.add(
        InkWell(
          child: Center(
            child: ListItem(
              TaskItem(task),
            ),
          ),
          onTap: () {
            _navigateToDetails(task);
          },
        ),
      );
    }
    return widgets;
  }

  void _navigateToCreation() {
    Navigator.pushNamed(
      context,
      Application.creationDestination,
    );
  }

  void _navigateToDetails(Task task) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text("You clicked on the task n°${task.id}!"),
        duration: const Duration(seconds: 5),
      ),
    );
  }
}
