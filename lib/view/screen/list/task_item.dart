import 'package:flutter/material.dart';
import 'package:todo_app_flutter/data/model/task_entity.dart';

class TaskItem extends StatelessWidget {
  final Task _task;

  const TaskItem(this._task, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text("Task n° ${_task.id}"),
      subtitle: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text(_task.content),
            Text("Created at ${_task.creationDate}")
          ],
        ),
      ),
    );
  }
}
