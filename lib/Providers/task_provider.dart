import 'package:flutter/material.dart';
import 'package:flutter_app/Api/http_service.dart';
import 'package:flutter_app/Consts/link_api.dart';

import '../Models/task.dart';

class TaskProvider extends ChangeNotifier {
  final HttpService httpService = HttpService();

  Future<List<Task>> get allTasksList async =>
      await httpService.getAllTasks(endpoint: allTasks);
  Future<List<Task>> get lateTasksList async => await _parseLateTasksList();
  Future<List<Task>> get todayTasksList async =>
      await httpService.getAllTasks(endpoint: 'today');
  Future<List<Task>> get weekTasksList async =>
      await httpService.getAllTasks(endpoint: 'week');
  Future<Map<String, dynamic>> getTaskByID(int id) async =>
      await httpService.getSingleTask(id);

  newTask({context, form, priorityButton, dateButton, Task task}) async {
    Task response = await httpService.postTask(map: task.toJson());
    //Task response = await apiRequest(task.toJson());
    print("Título da task ${response.title}");
    print("isDone? ${response.isDone}");

    notifyListeners();
    Navigator.of(context).pop();
  }

  patchReminderTask({int taskID, String reminder}) async {
    await httpService.patchTask(taskID, map: {"reminder": '$reminder'});

    notifyListeners();
  }

  patchPriorityTask({int taskID, String priority}) async {
    await httpService.patchTask(taskID, map: {"priority": '$priority'});

    notifyListeners();
  }

  patchTitleTask({int taskID, String title}) async {
    await httpService.patchTask(taskID, map: {"title": '$title'});

    notifyListeners();
  }

  patchIsDoneTask({bool check, int taskID}) async {
    await httpService.patchTask(taskID, map: {"isDone": check});

    notifyListeners();
  }

  deleteTask({context, taskID, endpoint}) async {
    print("ID da tarefa: " + taskID.toString());
    var delete = await httpService.deleteTask(taskID);

    notifyListeners();
    Navigator.of(context).pop();
  }

  Future<List<Task>> _parseLateTasksList() async {
    List<Task> lateTasks = await allTasksList;

    return lateTasks
        .where((task) => DateTime.parse(task.reminder).isBefore(DateTime.now()))
        .toList();
  }
}
