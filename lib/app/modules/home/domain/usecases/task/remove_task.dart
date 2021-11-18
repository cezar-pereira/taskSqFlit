// ignore_for_file: file_names

import 'package:dartz/dartz.dart';
import 'package:todolist_flutter/app/modules/home/domain/entities/task_entity.dart';
import 'package:todolist_flutter/app/modules/home/domain/errors/errors.dart';
import 'package:todolist_flutter/app/modules/home/domain/repositories/task_repository.dart';

abstract class RemoveTaskInterface {
  Future<Either<ErrorRemoveTaskEntity, bool>> call(
      {required TaskEntity taskEntity});
}

class RemoveTask implements RemoveTaskInterface {
  final TaskRepositoryInterface repository;

  RemoveTask({required this.repository});
  @override
  Future<Either<ErrorRemoveTaskEntity, bool>> call(
      {required TaskEntity taskEntity}) async {
    return await repository.removeTask(taskEntity: taskEntity);
  }
}
