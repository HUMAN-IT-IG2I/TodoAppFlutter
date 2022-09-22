import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:todo_app_flutter/view/screen/create/task_creation_view_model.dart';

import '../../../application.dart';

class TaskCreationScreen extends StatefulWidget {
  const TaskCreationScreen({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _TaskCreationScreenState();
}

class _TaskCreationScreenState extends State<TaskCreationScreen> {
  late TaskCreationViewModel _viewModel;
  final _contentController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Create a new task"),
      ),
      body: Container(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            TextFormField(
              controller: _contentController,
              maxLines: 1,
              decoration: const InputDecoration(
                  labelText: 'Content',
                  helperText: "Type your new task's content here"),
            ),
            Row(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                OutlinedButton(
                  onPressed: _navigateBack,
                  child: const Text("Cancel"),
                ),
                ElevatedButton(
                  onPressed: _addTask,
                  child: const Text("Create"),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  @override
  void dispose() {
    _contentController.dispose();
    super.dispose();
  }

  @override
  void initState() {
    super.initState();
    _viewModel = TaskCreationViewModel();
  }

  void _addTask() {
    String content = _contentController.text.trim();
    if (content.isNotEmpty) {
      _viewModel.addTask(content);
      _navigateBack(isTaskCreated: true);
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text("You cannot create a task with an empty content !"),
          duration: Duration(seconds: 3),
        ),
      );
    }
  }

  void _navigateBack({bool isTaskCreated = false}) {
    Navigator.of(context).pushNamed(
      Application.listDestination,
      arguments: isTaskCreated,
    );
  }
}
