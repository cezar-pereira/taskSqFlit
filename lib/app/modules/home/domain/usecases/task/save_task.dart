import 'package:dartz/dartz.dart';
import 'package:todolist_flutter/app/modules/home/domain/entities/task_entity.dart';
import 'package:todolist_flutter/app/modules/home/domain/errors/errors.dart';
import 'package:todolist_flutter/app/modules/home/domain/repositories/task_repository.dart';

abstract class SaveTaskInterface {
  Future<Either<ErrorSaveTaskEntity, bool>> call(
      {required TaskEntity taskEntity});
}

class SaveTask implements SaveTaskInterface {
  final TaskRepositoryInterface repository;

  SaveTask({required this.repository});

  @override
  Future<Either<ErrorSaveTaskEntity, bool>> call(
      {required TaskEntity taskEntity}) async {
    return await repository.saveTask(taskEntity: taskEntity);
  }
}
