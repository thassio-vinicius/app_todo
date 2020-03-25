import 'package:flutter/material.dart';
import 'package:flutter_app/Consts/link_api.dart';
import 'package:flutter_app/Providers/task_provider.dart';
import 'package:flutter_app/Widgets/Slivers/listview_sliver.dart';
import 'package:provider/provider.dart';

class AllTab extends StatefulWidget {
  @override
  _AllTabState createState() => _AllTabState();
}

class _AllTabState extends State<AllTab> {
  @override
  Widget build(BuildContext context) {
    return Container(
        color: Colors.white,
        child: Consumer<TaskProvider>(
          builder: (context, todos, child) => SliverListView(
            tasksList: todos.allTasksList,
            endpoint: allTasks,
            onRefresh: () {
              setState(() {});
            },
          ),
        ));
  }
}
