import 'package:todolist_flutter/app/modules/home/infra/models/task_model.dart';

abstract class TaskDataSourceInterface {
  Future<List<TaskModel>> fetchTasks();
  Future<bool> saveTask({required TaskModel task});
  Future<bool> updateTask({required TaskModel task});
  Future<bool> removeTask({required TaskModel task});
}
