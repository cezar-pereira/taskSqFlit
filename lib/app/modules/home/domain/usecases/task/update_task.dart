import 'package:dartz/dartz.dart';
import 'package:todolist_flutter/app/modules/home/domain/entities/task_entity.dart';
import 'package:todolist_flutter/app/modules/home/domain/errors/errors.dart';
import 'package:todolist_flutter/app/modules/home/domain/repositories/task_repository.dart';

abstract class UpdateTaskInterface {
  Future<Either<ErrorUpdateTaskEntity, bool>> call(
      {required TaskEntity taskEntity});
}

class UpdateTask implements UpdateTaskInterface {
  final TaskRepositoryInterface repository;

  UpdateTask({required this.repository});
  @override
  Future<Either<ErrorUpdateTaskEntity, bool>> call(
      {required TaskEntity taskEntity}) async {
    return await repository.updateTask(taskEntity: taskEntity);
  }
}
