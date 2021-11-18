import 'package:todolist_flutter/app/modules/home/domain/entities/task_entity.dart';
import 'package:todolist_flutter/app/modules/home/infra/datasourcers/task_datasource.dart';

class TaskDataSource implements TaskDataSourceInterface {
  @override
  Future<List<TaskEntity>> fetchTasks() {
    // TODO: implement fetchTasks
    throw UnimplementedError();
  }

  @override
  Future<bool> removeTask({required TaskEntity taskEntity}) {
    // TODO: implement removeTask
    throw UnimplementedError();
  }

  @override
  Future<bool> saveTask({required TaskEntity taskEntity}) {
    // TODO: implement saveTask
    throw UnimplementedError();
  }

  @override
  Future<bool> updateTask({required TaskEntity taskEntity}) {
    // TODO: implement updateTask
    throw UnimplementedError();
  }
}
