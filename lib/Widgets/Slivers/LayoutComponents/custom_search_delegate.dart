import 'package:flutter/material.dart';
import 'package:flutter_app/Consts/link_api.dart';
import 'package:flutter_app/Models/task.dart';
import 'package:flutter_app/Providers/task_provider.dart';
import 'package:flutter_app/Widgets/Slivers/LayoutComponents/case_container.dart';
import 'package:flutter_app/Widgets/Slivers/LayoutComponents/custom_progress_indicator.dart';
import 'package:flutter_app/Widgets/Slivers/LayoutComponents/task_list.dart';
import 'package:provider/provider.dart';

class CustomSearchHintDelegate extends SearchDelegate {
  final Future<List<Task>> provider;

  CustomSearchHintDelegate({
    this.provider,
    String hintText = 'Buscar',
  }) : super(
          searchFieldLabel: hintText,
          keyboardType: TextInputType.text,
          textInputAction: TextInputAction.search,
        );

  @override
  Widget buildLeading(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(left: 8),
      child: Icon(
        Icons.search,
        color: Colors.white,
        size: 26,
      ),
    );
  }

  @override
  Widget buildSuggestions(BuildContext context) => Consumer<TaskProvider>(
        builder: (context, tasks, child) => FutureBuilder<List<Task>>(
          future: provider,
          builder: (context, snapshot) {
            if (snapshot.data.toString() == '[]') {
              return CaseContainer(
                isRefreshable: false,
                useImage: true,
                image: 'assets/images/sol.png',
                title: "Opa!",
                firstSpan: "Parece que você",
                secondSpan: "ainda não tem lembretes.",
              );
            }

            switch (snapshot.connectionState) {
              case ConnectionState.waiting:
                return Center(child: CustomProgressIndicator());
                break;
              case ConnectionState.done:
                final results = snapshot?.data
                    ?.where((a) =>
                        a.title.toLowerCase().contains(query.toLowerCase()))
                    ?.toList();

                return Container(
                  color: Colors.black,
                  child: Container(
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(20),
                            topRight: Radius.circular(20))),
                    height: MediaQuery.of(context).size.height,
                    child: ListView(
                        primary: true,
                        shrinkWrap: true,
                        physics: AlwaysScrollableScrollPhysics(),
                        children: results
                            .map((a) => ListTile(
                                  title: Text(
                                    a.title,
                                    style: TextStyle(fontSize: 18),
                                  ),
                                  onTap: () {
                                    query = a.title;
                                    showResults(context);
                                  },
                                ))
                            .toList()),
                  ),
                );
                break;
              default:
                return Container();
            }
          },
        ),
      );

  @override
  List<Widget> buildActions(BuildContext context) => [
        Container(
          margin: EdgeInsets.only(right: 8),
          padding: EdgeInsets.only(right: 4),
          child: Center(
            child: InkWell(
              child: Text(
                "Cancelar",
                style: TextStyle(color: Colors.white, fontSize: 20),
              ),
              onTap: () => close(context, null),
            ),
          ),
        ),
      ];

  @override
  Widget buildResults(BuildContext context) {
    return Consumer<TaskProvider>(
      builder: (context, tasks, child) => FutureBuilder<List<Task>>(
        future: provider,
        builder: (context, snapshot) {
          if (snapshot.data.toString() == '[]') {
            return Container(
              color: Colors.black,
              child: Container(
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(20),
                        topRight: Radius.circular(20))),
                child: Center(child: Text("Não existem lembretes.")),
              ),
            );
          }

          final results = snapshot.data
              .where((a) => a.title.toLowerCase().contains(query.toLowerCase()))
              .toList();

          return Container(
            color: Colors.black,
            child: Container(
              decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(20),
                      topRight: Radius.circular(20))),
              child: TaskList(
                tasks: results,
                endpoint: allTasks,
                isSearchSuggestion: false,
              ),
            ),
          );
        },
      ),
    );
  }
}
