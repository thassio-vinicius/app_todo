import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app/Providers/task_provider.dart';
import 'package:flutter_app/Stores/date_store.dart';
import 'package:flutter_app/Widgets/Buttons/ModalButtons/LayoutComponents/modal_icon.dart';
import 'package:flutter_app/Widgets/Buttons/ModalButtons/PrimaryButtons/abstract_modal_button.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:provider/provider.dart';

class DateButton extends StatefulWidget {
  final DateStore dateStore;
  final String currentDate;
  final bool isNewTask;
  final int taskID;

  DateButton(
      {@required this.isNewTask,
      this.dateStore,
      this.currentDate,
      this.taskID});

  @override
  _DateButtonState createState() => _DateButtonState();
}

class _DateButtonState extends State<DateButton> {
  @override
  void initState() {
    if (!widget.isNewTask)
      widget.dateStore?.currentDate = DateTime.parse(widget.currentDate);
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
          onTap: () async => await _buildCupertinoDate(),
          modalIcon:
              ModalIcon(icon: CupertinoIcons.bell, color: Color(0xff9DA1A6)),
          text: "Lembrar-me",
          autoSizeText: widget.dateStore?.displayDate ?? 'Selecionar'),
    );
  }

  _buildCupertinoDate() async {
    print("tap date!");
    showCupertinoModalPopup(
      context: context,
      builder: (context) => Container(
        height: MediaQuery.of(context).size.height * 0.25,
        child: Consumer<TaskProvider>(
          builder: (context, provider, child) => GestureDetector(
            child: CupertinoDatePicker(
                mode: CupertinoDatePickerMode.dateAndTime,
                use24hFormat: true,
                initialDateTime: DateTime.now(),
                onDateTimeChanged: (date) =>
                    widget.dateStore.setDate(date, widget.isNewTask)),
            onTap: () async {
              if (!widget.isNewTask) {
                await provider.patchReminderTask(
                    reminder: widget.dateStore.settledDate,
                    taskID: widget.taskID);
              }

              return Navigator.pop(context);
            },
          ),
        ),
      ),
    );
  }
}
