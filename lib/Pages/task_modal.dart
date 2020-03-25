import 'package:flutter/material.dart';
import 'package:flutter_app/Models/task.dart';
import 'package:flutter_app/Providers/task_provider.dart';
import 'package:flutter_app/Stores/date_store.dart';
import 'package:flutter_app/Stores/priority_store.dart';
import 'package:flutter_app/Widgets/Buttons/ModalButtons/LayoutComponents/border.dart';
import 'package:flutter_app/Widgets/Buttons/ModalButtons/PrimaryButtons/date_button.dart';
import 'package:flutter_app/Widgets/Buttons/ModalButtons/PrimaryButtons/priority_button.dart';
import 'package:flutter_app/Widgets/Buttons/ModalButtons/SecondaryButtons/close_button.dart';
import 'package:flutter_app/Widgets/Buttons/ModalButtons/SecondaryButtons/confirm_button.dart';
import 'package:flutter_app/Widgets/Forms/task_form.dart';
import 'package:flutter_app/Widgets/Slivers/LayoutComponents/custom_progress_indicator.dart';
import 'package:provider/provider.dart';

class TaskModal extends StatefulWidget {
  final bool isNewTaskModal;
  final String endpoint;
  final Task getTask;

  TaskModal({@required this.isNewTaskModal, this.endpoint, this.getTask});

  @override
  _TaskModalState createState() => _TaskModalState();
}

class _TaskModalState extends State<TaskModal> {
  TextEditingController _formController = TextEditingController();
  PriorityStore _priorityStore = PriorityStore();
  DateStore _dateStore = DateStore();
  bool _isEmpty = false;

  @override
  Widget build(BuildContext context) {
    return _buildModal(context);
  }

  Container _buildModal(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.only(
            topRight: Radius.circular(20), topLeft: Radius.circular(20)),
        color: Colors.white,
      ),
      child: Padding(
        padding:
            EdgeInsets.only(bottom: MediaQuery.of(context).viewInsets.bottom),
        child: SingleChildScrollView(
            child: widget.isNewTaskModal
                ? Column(children: <Widget>[
                    _buildCancelButton(context),
                    TaskForm(
                      controller: _formController,
                      isNewTask: true,
                      isEmpty: _isEmpty,
                    ),
                    BuildBorder(),
                    DateButton(
                      dateStore: _dateStore,
                      isNewTask: widget.isNewTaskModal,
                    ),
                    BuildBorder(),
                    PriorityButton(
                      priorityStore: _priorityStore,
                      isNewTask: widget.isNewTaskModal,
                    ),
                    BuildBorder(),
                    _buildConfirmButton(context, widget.isNewTaskModal)
                  ])
                : FutureProvider<Task>(
                    create: (_) => Provider.of<TaskProvider>(context)
                        .getTaskByID(widget.getTask.id)
                        .then((task) => Task.fromJson(task)),
                    child: Consumer<Task>(builder: (context, task, child) {
                      if (task == null) {
                        return CustomProgressIndicator();
                      }
                      return Column(
                        children: <Widget>[
                          _buildCancelButton(context),
                          TaskForm(
                              currentTitle: task.title,
                              isEmpty: _isEmpty,
                              taskID: task.id,
                              isNewTask: widget.isNewTaskModal),
                          BuildBorder(),
                          DateButton(
                            dateStore: _dateStore,
                            currentDate: task.reminder,
                            isNewTask: widget.isNewTaskModal,
                            taskID: task.id,
                          ),
                          BuildBorder(),
                          PriorityButton(
                            priorityStore: _priorityStore,
                            currentPriority: task.priority,
                            isNewTask: widget.isNewTaskModal,
                            taskID: task.id,
                          ),
                          BuildBorder(),
                          _buildConfirmButton(context, widget.isNewTaskModal)
                        ],
                      );
                    }),
                  )),
      ),
    );
  }

  Padding _buildCancelButton(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(top: 10, right: 14),
      child: Align(
        alignment: Alignment.topRight,
        child: Container(
          decoration: BoxDecoration(
              color: Color(0xffE3E4E6).withOpacity(0.70),
              shape: BoxShape.circle),
          child: CancelButton(),
        ),
      ),
    );
  }

  Container _buildConfirmButton(BuildContext context, bool isNewTaskModal) {
    return Container(
      width: double.maxFinite,
      padding: EdgeInsets.only(
        top: MediaQuery.of(context).size.height * 0.02,
        bottom: MediaQuery.of(context).size.height * 0.02,
      ),
      child: Center(
          child: isNewTaskModal
              ? ConfirmButton(
                  buttonAction: "Adicionar",
                  color: Theme.of(context).primaryColor,
                  onTap: () async => await _newTask(),
                )
              : ConfirmButton(
                  onTap: () async => await _deleteTask(),
                  color: Color(0xffE3645B),
                  buttonAction: 'Apagar')),
    );
  }

  _deleteTask() {
    Provider.of<TaskProvider>(context, listen: false).deleteTask(
      context: context,
      taskID: widget.getTask.id,
      endpoint: widget.endpoint,
    );
  }

  _newTask() {
    var time = _dateStore.settledDate;
    var title = _formController.text;
    var priority = _priorityStore.settledPriority;

    if (title.isNotEmpty) {
      Task task =
          Task(title: title, isDone: false, priority: priority, reminder: time);

      Provider.of<TaskProvider>(context, listen: false)
          .newTask(task: task, context: context);

      print(title);
      print(time);
    } else {
      setState(() {
        _isEmpty = true;
      });
    }
  }
}
