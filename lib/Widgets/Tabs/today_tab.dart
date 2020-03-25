import 'package:flutter/material.dart';
import 'package:flutter_app/Providers/task_provider.dart';
import 'package:flutter_app/Widgets/Slivers/listview_sliver.dart';
import 'package:provider/provider.dart';

class TodayTab extends StatefulWidget {
  @override
  _TodayTabState createState() => _TodayTabState();
}

class _TodayTabState extends State<TodayTab> {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: Consumer<TaskProvider>(
        builder: (context, todos, child) => SliverListView(
          tasksList: todos.todayTasksList,
          endpoint: 'today',
          onRefresh: () {
            setState(() {});
          },
        ),
      ),
    );
  }
}
