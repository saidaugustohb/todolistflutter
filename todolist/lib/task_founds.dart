import 'package:flutter/material.dart';
import 'package:todolist/api.dart';
import 'package:todolist/task.dart';
import 'package:todolist/task_listing.dart';
import 'package:faker/faker.dart';

class TodoListPage extends StatefulWidget {
  TodoListPage({Key key, this.title}) : super(key: key);

  final String title;
  final TaskApi taskApi = TaskApi();
  @override
  _TodoListPageState createState() => _TodoListPageState();
}

class _TodoListPageState extends State<TodoListPage> {
  List<Task> tasks = [];
  bool loading = true;

  @override
  void initState() {
    super.initState();
    widget.taskApi.getTasks().then((data) {
      setState(() {
        tasks = data;
        loading = false;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(widget.title), centerTitle: true),
      body: loading
          ? Center(child: CircularProgressIndicator())
          : TasksListing(
              tasks: tasks,
              onDelete: _deleteTask,
            ),
      floatingActionButton: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          FloatingActionButton(
              backgroundColor: Colors.white,
              child: Icon(Icons.add),
              onPressed: _addTask,
              tooltip: 'Add Task')
        ],
      ),
    );
  }

  void _addTask() async {
    final faker = Faker();
    final task = faker.job.title();
    final createTask = await widget.taskApi.createTask(task);
    setState(() {
      tasks.add(createTask);
    });
  }

  void _deleteTask(String id) async {
    await widget.taskApi.deleteTask(id);
    setState(() {
      tasks.removeWhere((task) => task.id == id);
    });
  }
}
