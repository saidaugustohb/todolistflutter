import 'package:flutter/material.dart';

class TasksNotFound extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Text('Task not found', style: TextStyle(fontSize: 20))
        ],
      ),
    );
  }
}
