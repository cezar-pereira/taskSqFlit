import 'package:dartz/dartz.dart';
import 'package:todolist_flutter/app/modules/home/domain/entities/task_entity.dart';
import 'package:todolist_flutter/app/modules/home/domain/errors/errors.dart';
import 'package:todolist_flutter/app/modules/home/domain/repositories/task_repository.dart';

abstract class FetchTasksInterface {
  Future<Either<ErrorFetchTaskEntity, List<TaskEntity>>> call();
}

class FetchTasks implements FetchTasksInterface {
  final TaskRepositoryInterface repository;

  FetchTasks({required this.repository});
  @override
  Future<Either<ErrorFetchTaskEntity, List<TaskEntity>>> call() async {
    return await repository.fetchTasks();
  }
}
