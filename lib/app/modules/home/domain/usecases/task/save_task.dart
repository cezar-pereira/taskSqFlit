import 'package:dartz/dartz.dart';
import 'package:todolist_flutter/app/modules/home/domain/errors/errors.dart';
import 'package:todolist_flutter/app/modules/home/domain/repositories/task_repository.dart';
import 'package:todolist_flutter/app/modules/home/infra/models/task_model.dart';

abstract class SaveTaskInterface {
  Future<Either<ErrorSaveTaskEntity, bool>> call({required TaskModel task});
}

class SaveTask implements SaveTaskInterface {
  final TaskRepositoryInterface repository;

  SaveTask({required this.repository});

  @override
  Future<Either<ErrorSaveTaskEntity, bool>> call(
      {required TaskModel task}) async {
    return await repository.saveTask(task: task);
  }
}
