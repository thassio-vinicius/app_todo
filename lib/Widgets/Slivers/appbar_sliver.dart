import 'package:flutter/material.dart';
import 'package:flutter_app/Models/task.dart';
import 'package:flutter_app/Providers/task_provider.dart';
import 'package:flutter_app/Widgets/Slivers/LayoutComponents/custom_fading.dart';
import 'package:flutter_app/Widgets/Slivers/LayoutComponents/custom_search_delegate.dart';
import 'package:flutter_app/utils/date_format.dart';
import 'package:provider/provider.dart';

class CustomSliverAppBar extends StatefulWidget {
  final ScrollController scrollController;

  CustomSliverAppBar({this.scrollController});

  @override
  _CustomSliverAppBarState createState() => _CustomSliverAppBarState();
}

class _CustomSliverAppBarState extends State<CustomSliverAppBar> {
  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      backgroundColor: Colors.black,
      floating: false,
      pinned: true,
      centerTitle: true,
      title: CustomFading(
        fullOpacityOffset: 0,
        zeroOpacityOffset: 1,
        scrollController: widget.scrollController,
        child: Text(
          'Hoje',
          style: TextStyle(fontSize: 30, color: Colors.white),
        ),
      ),
      expandedHeight: MediaQuery.of(context).size.height * 0.25,
      actions: <Widget>[
        CustomFading(
          fullOpacityOffset: 0,
          zeroOpacityOffset: 1,
          scrollController: widget.scrollController,
          child: _buildSearchBar(context,
              width: 44, height: 44, iconSize: 30, isExpanded: false),
        )
      ],
      flexibleSpace: _buildFlexibleSpaceBar(
        context,
        scrollController: widget.scrollController,
        todayText: 'Hoje',
        dateText: dateFormat(),
        backgroundImage: 'assets/images/background.png',
      ),
    );
  }

  _buildSearchBar(BuildContext context,
      {double width, double height, double iconSize, bool isExpanded}) {
    return isExpanded
        ? Container(
            decoration:
                BoxDecoration(shape: BoxShape.circle, color: Colors.white),
            width: width,
            height: height,
            margin: EdgeInsets.only(right: 16),
            child: IconButton(
              icon: Icon(
                Icons.search,
                color: Colors.black,
                size: iconSize,
              ),
              onPressed: () {
                Future<List<Task>> provider =
                    Provider.of<TaskProvider>(context, listen: false)
                        .allTasksList;

                return showSearch(
                  context: context,
                  delegate: CustomSearchHintDelegate(provider: provider),
                );
              },
            ),
          )
        : IconButton(
            icon: Icon(
              Icons.search,
              color: Colors.white,
              size: iconSize,
            ),
            onPressed: () {
              Future<List<Task>> provider =
                  Provider.of<TaskProvider>(context, listen: false)
                      .allTasksList;

              return showSearch(
                context: context,
                delegate: CustomSearchHintDelegate(provider: provider),
              );
            },
          );
  }

  _buildFlexibleSpaceBar(
    BuildContext context, {
    ScrollController scrollController,
    String backgroundImage,
    String todayText,
    String dateText,
  }) {
    return FlexibleSpaceBar(
      collapseMode: CollapseMode.parallax,
      centerTitle: false,
      title: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.end,
        children: <Widget>[
          Column(
            mainAxisAlignment: MainAxisAlignment.end,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              _buildTodayText(todayText, context, scrollController),
              _buildCurrentDate(scrollController, dateText, context),
            ],
          ),
          SizedBox(width: 30),
          CustomFading(
            fullOpacityOffset: 1,
            scrollController: widget.scrollController,
            child: _buildSearchBar(context,
                width: 30, height: 30, iconSize: 16, isExpanded: true),
          ),
        ],
      ),
      background: Image.asset(
        backgroundImage,
        alignment: Alignment.topCenter,
        fit: BoxFit.cover,
      ),
    );
  }

  _buildTodayText(String todayText, BuildContext context,
      ScrollController scrollController) {
    return Flexible(
      child: CustomFading(
        scrollController: scrollController,
        fullOpacityOffset: 1,
        child: Text(
          todayText,
          overflow: TextOverflow.visible,
          style: TextStyle(
            color: Colors.white,
            fontSize: 24,
            height: 2.1,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }

  _buildCurrentDate(
    ScrollController scrollController,
    String dateText,
    BuildContext context,
  ) {
    return CustomFading(
      fullOpacityOffset: 1,
      scrollController: scrollController,
      child: Text(
        dateText,
        overflow: TextOverflow.clip,
        style: TextStyle(
            fontSize: 13,
            color: Color(0xff959CA6),
            fontWeight: FontWeight.normal),
      ),
    );
  }
}
