import 'package:flutter/material.dart';

class Task {
  int id;
  String title;
  bool isDone;
  String reminder;
  String priority;

  Task({
    @required this.title,
    @required this.reminder,
    this.id,
    this.priority,
    this.isDone = false,
  });

  factory Task.fromJson(Map<String, dynamic> json) {
    return Task(
      id: json['id'],
      title: json['title'],
      isDone: json['isDone'],
      reminder: json['reminder'],
      priority: json['priority'],
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['title'] = this.title;
    data['isDone'] = this.isDone;
    data['reminder'] = this.reminder;
    data['priority'] = this.priority;
    return data;
  }

  set toggleCompleted(value) {
    isDone = value;
  }
}
