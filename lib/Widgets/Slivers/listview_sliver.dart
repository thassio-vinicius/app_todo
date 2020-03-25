import 'package:flutter/material.dart';
import 'package:flutter_app/Models/task.dart';
import 'package:flutter_app/Widgets/Slivers/LayoutComponents/case_container.dart';
import 'package:flutter_app/Widgets/Slivers/LayoutComponents/custom_progress_indicator.dart';
import 'package:flutter_app/Widgets/Slivers/LayoutComponents/task_list.dart';

class SliverListView extends StatefulWidget {
  final Future<List<Task>> tasksList;
  final String endpoint;
  final onRefresh;

  SliverListView(
      {@required this.tasksList,
      @required this.endpoint,
      @required this.onRefresh});

  @override
  _SliverListViewState createState() => _SliverListViewState();
}

class _SliverListViewState extends State<SliverListView> {
  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: widget.tasksList.timeout(Duration(milliseconds: 3000)),
      builder: (context, snapshot) {
        print("Tem dados? " + snapshot.hasData.toString());

        if (snapshot.hasError) {
          print(snapshot.error);
        }

        switch (snapshot.connectionState) {
          case ConnectionState.waiting:
            return CustomProgressIndicator();
          case ConnectionState.done:
            print(snapshot.data);
            return _connectionStatements(snapshot);
          default:
            return _connectionStatements(snapshot);
        }
      },
    );
  }

  _connectionStatements(AsyncSnapshot snapshot) {
    if (!snapshot.hasData || snapshot.hasError) {
      return CaseContainer(
          useImage: false,
          isRefreshable: true,
          title: "Opa!",
          firstSpan: 'Tivemos um problema',
          secondSpan: 'ao carregar seus lembretes.',
          refreshButton: 'Tentar novamente',
          onTap: widget.onRefresh);
    }

    if (snapshot.data.toString() == '[]') {
      return CaseContainer(
        isRefreshable: false,
        useImage: true,
        title: "Tudo Limpo!",
        image: "assets/images/sol.png",
        firstSpan: "Adicione um novo lembrete",
        secondSpan: "tocando no '+'.",
      );
    } else {
      return _getTaskList(snapshot.data.toList(), widget.endpoint);
    }
  }

  _getTaskList(List<Task> tasks, String endpoint) {
    return TaskList(
      tasks: tasks,
      endpoint: endpoint,
      isSearchSuggestion: false,
    );
  }
}
