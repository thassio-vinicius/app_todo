import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app/Providers/task_provider.dart';
import 'package:flutter_app/Stores/priority_store.dart';
import 'package:flutter_app/Widgets/Buttons/ModalButtons/LayoutComponents/button_textstyle.dart';
import 'package:flutter_app/Widgets/Buttons/ModalButtons/LayoutComponents/modal_icon.dart';
import 'package:flutter_app/Widgets/Buttons/ModalButtons/PrimaryButtons/abstract_modal_button.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:provider/provider.dart';

class PriorityButton extends StatefulWidget {
  final PriorityStore priorityStore;
  final String currentPriority;
  final bool isNewTask;
  final int taskID;

  PriorityButton({
    @required this.isNewTask,
    this.priorityStore,
    this.currentPriority,
    this.taskID,
  });

  @override
  _PriorityButtonState createState() => _PriorityButtonState();
}

class _PriorityButtonState extends State<PriorityButton> {
  ScrollController _scroll = ScrollController();

  @override
  void initState() {
    if (!widget.isNewTask)
      widget.priorityStore?.currentPriority = widget.currentPriority;
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Observer(
      builder: (_) => TaskButton(
        isNewTaskModal: widget.isNewTask,
        onTap: () async => await _buildBottomSheet(_scroll, context),
        autoSizeText: widget.priorityStore?.priority ?? 'Selecionar',
        text: "Prioridade",
        modalIcon:
            ModalIcon(icon: CupertinoIcons.flag, color: Color(0xff9DA1A6)),
      ),
    );
  }

  _buildBottomSheet(ScrollController scrollController, context) {
    return showCupertinoModalPopup(
      context: context,
      useRootNavigator: false,
      builder: (context) {
        return SingleChildScrollView(
          scrollDirection: Axis.vertical,
          controller: scrollController,
          physics: ClampingScrollPhysics(),
          child: Container(
            height: MediaQuery.of(context).size.height * 0.25,
            child: GestureDetector(
              child: Observer(
                builder: (_) => CupertinoPicker.builder(
                    scrollController: FixedExtentScrollController(
                        initialItem: widget.priorityStore?.priorityIndex ??
                            widget.currentPriority),
                    itemExtent: 40,
                    backgroundColor: Colors.white,
                    childCount: widget.priorityStore?.priorities?.length ?? 4,
                    itemBuilder: (context, index) => Center(
                        child: StyledText(
                            text: widget.priorityStore?.priorities[index])),
                    onSelectedItemChanged: (index) async => await widget
                        .priorityStore
                        ?.setPriority(index, widget.isNewTask)),
              ),
              onTap: () async {
                print(
                    "Prioridade pickada:${widget.priorityStore.settledPriority}");
                print(
                    "Indice da prioridade: ${widget.priorityStore.priorityIndex}");

                if (!widget.isNewTask) {
                  await Provider.of<TaskProvider>(context, listen: false)
                      .patchPriorityTask(
                          priority: widget.priorityStore.settledPriority,
                          taskID: widget.taskID);
                }
                return Navigator.pop(context);
              },
            ),
          ),
        );
      },
    );
  }
}
