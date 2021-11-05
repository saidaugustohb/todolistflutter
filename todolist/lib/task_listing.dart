import 'package:flutter/material.dart';
import 'package:todolist/task.dart';
import 'package:todolist/task_not_fount.dart';

class TasksListing extends StatelessWidget {
  final List<Task> tasks;
  final Function(String id) onDelete;

  TasksListing({this.tasks, this.onDelete});

  @override
  Widget build(BuildContext context) {
    return tasks.isEmpty
        ? TasksNotFound()
        : ListView(
            children: [
              ...tasks.map<Widget>((tasks) => Padding(
                    padding: const EdgeInsets.all(8),
                    child: ListTile(
                      title: Text(tasks.name),
                      trailing: FlatButton(
                        child: Icon(Icons.delete),
                        onPressed: () {
                          onDelete(tasks.id);
                        },
                      ),
                    ),
                  )),
              SizedBox(
                height: 100,
              )
            ],
          );
  }
}
