class Task {
  final String id;
  final String name;

  const Task._(this.id, this.name);

  factory Task.fromJson(Map json) {
    final id = json['_id'].replaceAll('ObjectId(\"', '').replaceAll('\")', '');
    final name = json['name'];
    return Task._(id, name);
  }
}
