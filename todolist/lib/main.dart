import 'package:flutter/material.dart';
import 'package:todolist/task_founds.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData.dark(),
        home: TodoListPage(title: 'T-Evolvers'));
  }
}
