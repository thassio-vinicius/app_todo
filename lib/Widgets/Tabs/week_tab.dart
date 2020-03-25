import 'package:flutter/material.dart';
import 'package:flutter_app/Providers/task_provider.dart';
import 'package:flutter_app/Widgets/Slivers/listview_sliver.dart';
import 'package:provider/provider.dart';

class WeekTab extends StatefulWidget {
  @override
  _WeekTabState createState() => _WeekTabState();
}

class _WeekTabState extends State<WeekTab> {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: Consumer<TaskProvider>(
        builder: (context, todos, child) => SliverListView(
          tasksList: todos.weekTasksList,
          endpoint: 'week',
          onRefresh: () {
            setState(() {});
          },
        ),
      ),
    );
  }
}
