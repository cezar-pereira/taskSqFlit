import 'package:todolist_flutter/app/modules/home/domain/entities/task_entity.dart';

abstract class TaskDataSourceInterface {
  Future<List<TaskEntity>> fetchTasks();
  Future<bool> saveTask({required TaskEntity taskEntity});
  Future<bool> updateTask({required TaskEntity taskEntity});
  Future<bool> removeTask({required TaskEntity taskEntity});
}
