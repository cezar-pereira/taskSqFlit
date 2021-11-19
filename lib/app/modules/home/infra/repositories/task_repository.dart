import 'package:todolist_flutter/app/modules/home/domain/errors/errors.dart';
import 'package:dartz/dartz.dart';
import 'package:todolist_flutter/app/modules/home/domain/repositories/task_repository.dart';
import 'package:todolist_flutter/app/modules/home/infra/datasourcers/task_datasource.dart';
import 'package:todolist_flutter/app/modules/home/infra/models/task_model.dart';

class TaskRepository implements TaskRepositoryInterface {
  final TaskDataSourceInterface dataSource;

  TaskRepository({required this.dataSource});

  @override
  Future<Either<ErrorFetchTaskEntity, List<TaskModel>>> fetchTasks() async {
    try {
      var result = await dataSource.fetchTasks();
      return Right(result);
    } catch (e) {
      return Left(ErrorFetchTaskEntity(message: 'Erro ao buscar tarefas.'));
    }
  }

  @override
  Future<Either<ErrorRemoveTaskEntity, bool>> removeTask(
      {required TaskModel task}) async {
    try {
      var result = await dataSource.removeTask(task: task);
      if (result) {
        return Right(result);
      } else {
        return Left(ErrorRemoveTaskEntity(message: 'Erro ao remover tarefa.'));
      }
    } catch (e) {
      return Left(ErrorRemoveTaskEntity(message: 'Erro ao remover tarefa.'));
    }
  }

  @override
  Future<Either<ErrorSaveTaskEntity, bool>> saveTask(
      {required TaskModel task}) async {
    try {
      var result = await dataSource.saveTask(task: task);

      if (result) {
        return Right(result);
      } else {
        return Left(ErrorSaveTaskEntity(message: 'Erro ao salvar tarefa.'));
      }
    } catch (e) {
      return Left(ErrorSaveTaskEntity(message: 'Erro ao salvar tarefa.'));
    }
  }

  @override
  Future<Either<ErrorUpdateTaskEntity, bool>> updateTask(
      {required TaskModel task}) async {
    try {
      var result = await dataSource.updateTask(task: task);
      if (result) {
        return Right(result);
      } else {
        return Left(ErrorUpdateTaskEntity(message: 'Erro ao alterar tarefa.'));
      }
    } catch (e) {
      return Left(ErrorUpdateTaskEntity(message: 'Erro ao alterar tarefa.'));
    }
  }
}
