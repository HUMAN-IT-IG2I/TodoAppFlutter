import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:todo_app_flutter/data/model/task_entity.dart';
import 'package:todo_app_flutter/utils/date_utils.dart';
import 'package:todo_app_flutter/view/screen/details/task_details_view_model.dart';

import '../../../application.dart';

class TaskDetailsScreen extends StatefulWidget {
  const TaskDetailsScreen({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _TaskDetailsScreen();
}

class _TaskDetailsScreen extends State<TaskDetailsScreen> {
  late TaskDetailsViewModel _viewModel;
  late Task _task;

  @override
  Widget build(BuildContext context) {
    final taskId = ModalRoute.of(context)!.settings.arguments as int?;

    if (taskId == null || _viewModel.retrieveTask(taskId) == null) {
      Navigator.pop(context);
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content:
              Text("Error while trying to display this task. Please try again"),
        ),
      );
    }
    _task = _viewModel.retrieveTask(taskId!)!;

    return Scaffold(
        appBar: AppBar(title: Text('Task n°${_task.id}')),
        body: Container(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Task n° ${_task.id}",
                    style: Theme.of(context).textTheme.headline5,
                  ),
                  const SizedBox(height: 16),
                  Text(
                    _task.content,
                    style: Theme.of(context).textTheme.bodyText1,
                  ),
                  const SizedBox(height: 16),
                  Text(
                    "Created the ${AppDateUtils.extractDateFromDateTime(_task.creationDate)} at ${AppDateUtils.extractTimeFromDateTime(_task.creationDate)}",
                    style: Theme.of(context).textTheme.bodyText1,
                  )
                ],
              ),
              Row(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  OutlinedButton(
                    onPressed: _navigateBack,
                    child: const Text("Back"),
                  ),
                  ElevatedButton(
                    onPressed: _markTaskAsDone,
                    child: const Text("Mark as done"),
                  ),
                ],
              )
            ],
          ),
        ));
  }

  @override
  void initState() {
    super.initState();
    _viewModel = TaskDetailsViewModel();
  }

  void _markTaskAsDone() {
    _viewModel.markTaskAsDone();
    _navigateBack(isMarkedAsDone: true);
  }

  void _navigateBack({bool isMarkedAsDone = false}) {
    Navigator.of(context).pushNamed(
      Application.listDestination,
      arguments: isMarkedAsDone,
    );
  }
}
