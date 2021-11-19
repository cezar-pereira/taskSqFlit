import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:todolist_flutter/app/modules/home/domain/usecases/task/save_task.dart';
import 'package:todolist_flutter/app/modules/home/domain/usecases/task/update_task.dart';
import 'package:todolist_flutter/app/modules/home/infra/models/task_model.dart';

class CreateEditTaskController {
  final UpdateTaskInterface updateTasksUsecase;
  final SaveTaskInterface saveTaskUsecase;
  var nameController = TextEditingController();
  var dateController = TextEditingController();
  DateTime selectedDate = DateTime.now();

  CreateEditTaskController(
      {required this.updateTasksUsecase, required this.saveTaskUsecase});

  setDate() {
    dateController.text = _formatDate(date: selectedDate);
  }

  String _formatDate({required DateTime date}) {
    final DateFormat formatter = DateFormat('dd/MM/yyyy');
    final String formatted = formatter.format(date);
    return formatted;
  }

  setValuesTask({required TaskModel? task}) {
    nameController.text = task!.name;
    selectedDate = task.date;
  }

  createTask() async {
    var task = TaskModel(name: nameController.text, date: selectedDate);
    var result = await saveTaskUsecase.call(task: task);
  }

  updateTask({required TaskModel? task}) async {
    task = task!.copyWith(name: nameController.text, date: selectedDate);
    var result = await updateTasksUsecase.call(task: task);
  }
}
