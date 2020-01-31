// To parse this JSON data, do
//
//     final task = taskFromJson(jsonString);

import 'dart:convert';

Task taskFromJson(String str) => Task.fromJson(json.decode(str));

String taskToJson(Task data) => json.encode(data.toJson());

class Task {
  int id;
  String task;
  bool value;

  Task({
    this.id,
    this.task,
    this.value,
  });

  factory Task.fromJson(Map<String, dynamic> json) => Task(
    id: json["id"],
    task: json["task"],
    value: json["value"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "task": task,
    "value": value,
  };
}
