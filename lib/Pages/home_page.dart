import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_app/Pages/task_modal.dart';
import 'package:flutter_app/Widgets/Buttons/HomeButtons/addtask_button.dart';
import 'package:flutter_app/Widgets/Slivers/appbar_sliver.dart';
import 'package:flutter_app/Widgets/Slivers/tabs_sliver.dart';
import 'package:flutter_app/Widgets/Tabs/all_tab.dart';
import 'package:flutter_app/Widgets/Tabs/late_tab.dart';
import 'package:flutter_app/Widgets/Tabs/today_tab.dart';
import 'package:flutter_app/Widgets/Tabs/week_tab.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> with SingleTickerProviderStateMixin {
  ScrollController _scrollController =
      ScrollController(keepScrollOffset: false);
  TabController _tabController;

  final List<Widget> _tabs = [
    AllTab(),
    TodayTab(),
    WeekTab(),
    LateTab(),
  ];

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: _tabs.length, vsync: this);
    SystemChrome.setEnabledSystemUIOverlays(SystemUiOverlay.values);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      resizeToAvoidBottomInset: true,
      body: _buildCustomScrollView(),
      floatingActionButton: _buildFloatingButton(context),
    );
  }

  AddTaskButton _buildFloatingButton(BuildContext context) {
    return AddTaskButton(
        color: Color(0xff0051FF),
        label: Icon(
          Icons.add,
          size: 36,
        ),
        onPressed: () => showModalBottomSheet(
            isScrollControlled: true,
            backgroundColor: Colors.transparent,
            context: context,
            builder: (context) => TaskModal(isNewTaskModal: true)));
  }

  CustomScrollView _buildCustomScrollView() {
    return CustomScrollView(
      controller: _scrollController,
      shrinkWrap: false,
      physics: AlwaysScrollableScrollPhysics(),
      slivers: <Widget>[
        CustomSliverAppBar(scrollController: _scrollController),
        SliverTabs(controller: _tabController, tabs: _tabs),
        SliverFillRemaining(
          child: Container(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height,
            child: TabBarView(
                physics: AlwaysScrollableScrollPhysics(),
                controller: _tabController,
                children: _tabs),
          ),
        ),
        //SliverListView()
      ],
    );
  }
}
