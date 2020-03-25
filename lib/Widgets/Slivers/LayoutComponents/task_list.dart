import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app/Models/task.dart';
import 'package:flutter_app/Widgets/Buttons/HomeButtons/task_item_button.dart';

class TaskList extends StatelessWidget {
  final List<Task> tasks;
  final String endpoint;
  final bool isSearchSuggestion;
  final Function onTap;

  TaskList({
    @required this.tasks,
    @required this.endpoint,
    @required this.isSearchSuggestion,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      scrollDirection: Axis.vertical,
      shrinkWrap: true,
      physics: AlwaysScrollableScrollPhysics(),
      itemCount: tasks.length,
      itemBuilder: (context, index) => TaskItemButton(
          onTap: onTap,
          task: tasks[index],
          endpoint: endpoint,
          isSearchSuggestion: isSearchSuggestion),
    );
  }
}
