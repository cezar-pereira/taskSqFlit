import 'package:dartz/dartz.dart';
import 'package:todolist_flutter/app/modules/home/domain/entities/task_entity.dart';
import 'package:todolist_flutter/app/modules/home/domain/errors/errors.dart';

abstract class TaskRepositoryInterface {
  Future<Either<ErrorSaveTaskEntity, bool>> saveTask(
      {required TaskEntity taskEntity});
  Future<Either<ErrorFetchTaskEntity, List<TaskEntity>>> fetchTasks();
  Future<Either<ErrorUpdateTaskEntity, bool>> updateTask(
      {required TaskEntity taskEntity});
  Future<Either<ErrorRemoveTaskEntity, bool>> removeTask(
      {required TaskEntity taskEntity});
}
