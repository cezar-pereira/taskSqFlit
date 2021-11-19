import 'package:dartz/dartz.dart';
import 'package:todolist_flutter/app/modules/home/domain/errors/errors.dart';
import 'package:todolist_flutter/app/modules/home/infra/models/task_model.dart';

abstract class TaskRepositoryInterface {
  Future<Either<ErrorSaveTaskEntity, bool>> saveTask({required TaskModel task});
  Future<Either<ErrorFetchTaskEntity, List<TaskModel>>> fetchTasks();
  Future<Either<ErrorUpdateTaskEntity, bool>> updateTask(
      {required TaskModel task});
  Future<Either<ErrorRemoveTaskEntity, bool>> removeTask(
      {required TaskModel task});
}
