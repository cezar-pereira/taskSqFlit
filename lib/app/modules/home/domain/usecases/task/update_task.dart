import 'package:dartz/dartz.dart';
import 'package:todolist_flutter/app/modules/home/domain/errors/errors.dart';
import 'package:todolist_flutter/app/modules/home/domain/repositories/task_repository.dart';
import 'package:todolist_flutter/app/modules/home/infra/models/task_model.dart';

abstract class UpdateTaskInterface {
  Future<Either<ErrorUpdateTaskEntity, bool>> call({required TaskModel task});
}

class UpdateTask implements UpdateTaskInterface {
  final TaskRepositoryInterface repository;

  UpdateTask({required this.repository});
  @override
  Future<Either<ErrorUpdateTaskEntity, bool>> call(
      {required TaskModel task}) async {
    return await repository.updateTask(task: task);
  }
}
