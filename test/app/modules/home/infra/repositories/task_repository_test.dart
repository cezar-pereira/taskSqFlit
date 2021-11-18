import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:todolist_flutter/app/modules/home/domain/entities/task_entity.dart';
import 'package:todolist_flutter/app/modules/home/domain/errors/errors.dart';
import 'package:todolist_flutter/app/modules/home/domain/repositories/task_repository.dart';

class TaskRepositoryMock extends Mock implements TaskRepositoryInterface {}

void main() {
  late final TaskRepositoryInterface repository;

  setUpAll(() {
    repository = TaskRepositoryMock();
  });

  group('FETCH TAKS', () {
    test('Should return a List<TaskEntity>', () async {
      final List<TaskEntity> list = [];
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
    var taskEntity = TaskEntity(name: 'name', date: DateTime.now());
    test('Should return TRUE', () async {
      when(() => repository.removeTask(taskEntity: taskEntity))
          .thenAnswer((_) async => const Right(true));
      var result = await repository.removeTask(taskEntity: taskEntity);
      expect(result, const Right(true));

      verify(() => repository.removeTask(taskEntity: taskEntity)).called(1);
    });

    test('Should return ErrorRemoveTaskEntity', () async {
      ErrorRemoveTaskEntity error = ErrorRemoveTaskEntity(message: 'error');
      when(() => repository.removeTask(taskEntity: taskEntity))
          .thenAnswer((_) async => Left(error));
      var result = await repository.removeTask(taskEntity: taskEntity);
      expect(result, Left(error));
    });
  });

  group('SAVE TASK', () {
    var taskEntity = TaskEntity(name: 'name', date: DateTime.now());
    test('Should return TRUE', () async {
      when(() => repository.saveTask(taskEntity: taskEntity))
          .thenAnswer((_) async => const Right(true));
      var result = await repository.saveTask(taskEntity: taskEntity);
      expect(result, const Right(true));

      verify(() => repository.saveTask(taskEntity: taskEntity)).called(1);
    });

    test('Should return ErrorSaveTaskEntity', () async {
      ErrorSaveTaskEntity error = ErrorSaveTaskEntity(message: 'error');
      when(() => repository.saveTask(taskEntity: taskEntity))
          .thenAnswer((_) async => Left(error));
      var result = await repository.saveTask(taskEntity: taskEntity);
      expect(result, Left(error));
    });
  });

  group('UPDATE TASK', () {
    var taskEntity = TaskEntity(name: 'name', date: DateTime.now());
    test('Should return TRUE', () async {
      when(() => repository.updateTask(taskEntity: taskEntity))
          .thenAnswer((_) async => const Right(true));
      var result = await repository.updateTask(taskEntity: taskEntity);
      expect(result, const Right(true));

      verify(() => repository.updateTask(taskEntity: taskEntity)).called(1);
    });

    test('Should return ErrorUpdateTaskEntity', () async {
      ErrorUpdateTaskEntity error = ErrorUpdateTaskEntity(message: 'error');
      when(() => repository.updateTask(taskEntity: taskEntity))
          .thenAnswer((_) async => Left(error));
      var result = await repository.updateTask(taskEntity: taskEntity);
      expect(result, Left(error));
    });
  });
}
