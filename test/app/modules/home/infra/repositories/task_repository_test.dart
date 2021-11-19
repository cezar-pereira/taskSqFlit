import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:todolist_flutter/app/modules/home/domain/errors/errors.dart';
import 'package:todolist_flutter/app/modules/home/domain/repositories/task_repository.dart';
import 'package:todolist_flutter/app/modules/home/infra/models/task_model.dart';

class TaskRepositoryMock extends Mock implements TaskRepositoryInterface {}

void main() {
  late final TaskRepositoryInterface repository;

  setUpAll(() {
    repository = TaskRepositoryMock();
  });

  group('FETCH TAKS', () {
    test('Should return a List<TaskEntity>', () async {
      final List<TaskModel> list = [];
      when(() => repository.fetchTasks()).thenAnswer((_) async => Right(list));
      var result = await repository.fetchTasks();
      expect(result, Right(list));

      verify(() => repository.fetchTasks()).called(1);
    });

    test('Should return ErrorFetchTaskEntity', () async {
      final ErrorFetchTaskEntity error = ErrorFetchTaskEntity(message: 'error');

      when(() => repository.fetchTasks()).thenAnswer((_) async => Left(error));
      var result = await repository.fetchTasks();
      expect(result, Left(error));
    });
  });

  group('REMOVE TASK', () {
    var task =
        TaskModel(name: 'Name', date: DateTime.now(), id: '1', isDone: false);
    test('Should return TRUE', () async {
      when(() => repository.removeTask(task: task))
          .thenAnswer((_) async => const Right(true));
      var result = await repository.removeTask(task: task);
      expect(result, const Right(true));

      verify(() => repository.removeTask(task: task)).called(1);
    });

    test('Should return ErrorRemoveTaskEntity', () async {
      ErrorRemoveTaskEntity error = ErrorRemoveTaskEntity(message: 'error');
      when(() => repository.removeTask(task: task))
          .thenAnswer((_) async => Left(error));
      var result = await repository.removeTask(task: task);
      expect(result, Left(error));
    });
  });

  group('SAVE TASK', () {
    var task =
        TaskModel(name: 'Name', date: DateTime.now(), id: '1', isDone: false);
    test('Should return TRUE', () async {
      when(() => repository.saveTask(task: task))
          .thenAnswer((_) async => const Right(true));
      var result = await repository.saveTask(task: task);
      expect(result, const Right(true));

      verify(() => repository.saveTask(task: task)).called(1);
    });

    test('Should return ErrorSaveTaskEntity', () async {
      ErrorSaveTaskEntity error = ErrorSaveTaskEntity(message: 'error');
      when(() => repository.saveTask(task: task))
          .thenAnswer((_) async => Left(error));
      var result = await repository.saveTask(task: task);
      expect(result, Left(error));
    });
  });

  group('UPDATE TASK', () {
    var task =
        TaskModel(name: 'Name', date: DateTime.now(), id: '1', isDone: false);
    test('Should return TRUE', () async {
      when(() => repository.updateTask(task: task))
          .thenAnswer((_) async => const Right(true));
      var result = await repository.updateTask(task: task);
      expect(result, const Right(true));

      verify(() => repository.updateTask(task: task)).called(1);
    });

    test('Should return ErrorUpdateTaskEntity', () async {
      ErrorUpdateTaskEntity error = ErrorUpdateTaskEntity(message: 'error');
      when(() => repository.updateTask(task: task))
          .thenAnswer((_) async => Left(error));
      var result = await repository.updateTask(task: task);
      expect(result, Left(error));
    });
  });
}
