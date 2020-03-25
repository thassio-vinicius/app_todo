import 'package:flutter/material.dart';
import 'package:flutter_app/Providers/task_provider.dart';
import 'package:flutter_app/Widgets/Buttons/ModalButtons/LayoutComponents/circle_icon.dart';
import 'package:provider/provider.dart';

class TaskForm extends StatefulWidget {
  final TextEditingController controller;
  final bool isNewTask;
  final int taskID;
  final String currentTitle;
  final bool isEmpty;

  TaskForm(
      {@required this.isEmpty,
      this.controller,
      this.currentTitle,
      this.isNewTask,
      this.taskID});

  @override
  _TaskFormState createState() => _TaskFormState();
}

class _TaskFormState extends State<TaskForm> {
  TextEditingController _taskController;

  initState() {
    if (!widget.isNewTask) {
      _taskController = TextEditingController(text: widget.currentTitle);
    }

    super.initState();
  }

  Widget build(BuildContext context) {
    return TextField(
      cursorColor: Theme.of(context).primaryColor,
      decoration: InputDecoration(
        border: OutlineInputBorder(borderSide: BorderSide.none),
        icon: CircleIcon(
          isModalIcon: true,
          width: 30,
          height: 30,
        ),
        errorText:
            widget.isEmpty ? 'Opa! O título não pode ficar vazio!' : null,
        hintText: "Novo Lembrete",
        hintStyle: TextStyle(
            color: Color(0xff9DA1A6),
            fontSize: 34,
            fontWeight: FontWeight.normal),
      ),
      autofocus: true,
      controller: widget.isNewTask ? widget.controller : _taskController,
      textInputAction: TextInputAction.done,
      style: TextStyle(
          color: Colors.black, fontSize: 34, fontWeight: FontWeight.bold),
      onSubmitted: (value) async {
        print(value);

        if (!widget.isNewTask) {
          await Provider.of<TaskProvider>(context, listen: false)
              .patchTitleTask(taskID: widget.taskID, title: value);
        }
      },
    );
  }
}
