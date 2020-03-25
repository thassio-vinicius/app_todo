import 'package:flutter/material.dart';

class SliverTabs extends StatefulWidget {
  final TabController controller;
  final List<Widget> tabs;

  SliverTabs({@required this.controller, @required this.tabs});

  @override
  _SliverTabsState createState() => _SliverTabsState();
}

class _SliverTabsState extends State<SliverTabs> {
  @override
  Widget build(BuildContext context) {
    return SliverList(
      delegate: SliverChildBuilderDelegate(
        (context, index) {
          return DefaultTabController(
              initialIndex: 1,
              length: widget.tabs.length,
              child: Container(
                decoration: BoxDecoration(
                  shape: BoxShape.rectangle,
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(32.0),
                  ),
                ),
                padding: EdgeInsets.only(top: 20, right: 8, left: 8),
                height: MediaQuery.of(context).size.height * 0.11,
                width: MediaQuery.of(context).size.width,
                child: Scaffold(
                    backgroundColor: Colors.white,
                    appBar: TabBar(
                        controller: widget.controller,
                        isScrollable: true,
                        unselectedLabelColor: Color(0xff959CA6),
                        indicatorSize: TabBarIndicatorSize.tab,
                        indicator: BoxDecoration(
                            borderRadius: BorderRadius.circular(32),
                            color: Colors.black),
                        tabs: [
                          _buildTab(title: "Todos"),
                          _buildTab(title: "Hoje"),
                          _buildTab(title: "Esta Semana"),
                          _buildTab(title: "Atrasados"),
                        ]),
                    ),
              ));
        },
        childCount: 1,
      ),
    );
  }

  Tab _buildTab({@required String title}) {
    return Tab(
      child: Align(
        alignment: Alignment.center,
        child: Text(title, style: TextStyle(fontSize: 20)),
      ),
    );
  }
}
