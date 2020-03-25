import 'package:flutter/material.dart';
import 'package:flutter_app/Consts/link_api.dart';
import 'package:flutter_app/Providers/task_provider.dart';
import 'package:flutter_app/Widgets/Slivers/listview_sliver.dart';
import 'package:provider/provider.dart';

class LateTab extends StatefulWidget {
  @override
  _LateTabState createState() => _LateTabState();
}

class _LateTabState extends State<LateTab> {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: Consumer<TaskProvider>(
        builder: (context, todos, child) => SliverListView(
          tasksList: todos.lateTasksList,
          endpoint: allTasks,
          onRefresh: () {
            setState(() {});
          },
        ),
      ),
    );
  }
}
