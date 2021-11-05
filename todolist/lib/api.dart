import 'package:dio/dio.dart';
import 'package:todolist/task.dart';

class TaskApi {
  final _dio = Dio(BaseOptions(baseUrl: 'http://10.0.2.2:8081/'));

  Future<List<Task>> getTasks() async {
    final response = await _dio.get('');
    return (response.data['tasks'] as List)
        .map<Task>((json) => Task.fromJson(json))
        .toList();
  }

  Future<Task> createTask(String name) async {
    final response = await _dio.post('', data: {'name': name});
    return Task.fromJson(response.data);
  }

  Future deleteTask(String id) async {
    final response = await _dio.delete('/$id');
    return response.data;
  }
}
