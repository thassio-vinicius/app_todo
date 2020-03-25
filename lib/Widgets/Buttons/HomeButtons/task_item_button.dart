import 'package:flutter/material.dart';
import 'package:flutter_app/Api/http_service.dart';
import 'package:flutter_app/Models/task.dart';
import 'package:flutter_app/Pages/task_modal.dart';
import 'package:flutter_app/Widgets/Buttons/HomeButtons/LayoutComponents/circular_checkbox.dart';
import 'package:flutter_app/Widgets/Buttons/ModalButtons/LayoutComponents/circle_icon.dart';

class TaskItemButton extends StatefulWidget {
  final Task task;
  final String endpoint;
  final bool isSearchSuggestion;
  final Function onTap;

  TaskItemButton({
    @required this.task,
    @required this.endpoint,
    @required this.isSearchSuggestion,
    this.onTap,
  });

  @override
  _TaskItemButtonState createState() => _TaskItemButtonState();
}

class _TaskItemButtonState extends State<TaskItemButton> {
  bool _isToday = false;
  //String _priorityIndicator;
  bool _getValue() {
    return widget.task.isDone;
  }

  _caseReminder() {
    if (DateTime.parse(widget.task.reminder).day == DateTime.now().day) {
      setState(() {
        _isToday = true;
      });
    }
  }

  @override
  void initState() {
    _caseReminder();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: CircularCheckBox(
          activeColor: Colors.black,
          value: _getValue(),
          onChanged: !widget.isSearchSuggestion
              ? (check) {
                  print(check);
                  print("TAP!");
                  HttpService()
                      .patchTask(widget.task.id, map: {'isDone': check});

                  setState(() {
                    widget.task.toggleCompleted = check;
                  });
                }
              : (_) {}),
      title: Text(widget.task.title,
          style: widget.task.isDone
              ? TextStyle(
                  color: Colors.grey,
                  fontSize: 17,
                  decoration: TextDecoration.lineThrough)
              : TextStyle(
                  color: Colors.black,
                  fontSize: 17,
                  decoration: TextDecoration.none)),
      subtitle: _isToday
          ? Align(
              alignment: Alignment(-50, 0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  CircleIcon(
                    isModalIcon: false,
                    width: 6,
                    height: 6,
                  ),
                  Text(
                    "   Hoje   -   ${widget.task.priority}",
                    style: TextStyle(color: Color(0xff9DA1A6), fontSize: 14),
                  ),
                ],
              ),
            )
          : null,
      onTap: !widget.isSearchSuggestion
          ? () {
              return showModalBottomSheet(
                  isScrollControlled: true,
                  backgroundColor: Colors.transparent,
                  context: context,
                  builder: (context) {
                    return TaskModal(
                        isNewTaskModal: false, getTask: widget.task);
                  });
            }
          : widget.onTap,
    );
  }
}
