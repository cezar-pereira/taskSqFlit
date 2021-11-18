import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:todolist_flutter/app/modules/home/domain/entities/task_entity.dart';
import 'package:todolist_flutter/app/modules/home/domain/errors/errors.dart';
import 'package:todolist_flutter/app/modules/home/domain/repositories/task_repository.dart';
import 'package:todolist_flutter/app/modules/home/domain/usecases/task/update_task.dart';

class TaskRepositoryMock extends Mock implements TaskRepositoryInterface {}

void main() {
  late final TaskRepositoryInterface repository;
  late final UpdateTaskInterface useCase;
  late final TaskEntity taskEntity;
  setUpAll(() {
    taskEntity = TaskEntity(name: 'Name', date: DateTime.now());
    repository = TaskRepositoryMock();
    useCase = UpdateTask(repository: repository);
  });

  test('Should return TRUE', () async {
    bool status = true;
    when(() => repository.updateTask(taskEntity: taskEntity))
        .thenAnswer((_) async => Right(status));

    var result = await useCase.call(taskEntity: taskEntity);
    expect(result, Right(status));
    verify(() => repository.updateTask(taskEntity: taskEntity)).called(1);
  });

  test('Should retunr a ERROR when updateTask', () async {
    var error = ErrorUpdateTaskEntity(message: 'error');
    when(() => repository.updateTask(taskEntity: taskEntity))
        .thenAnswer((_) async => Left(error));
    var result = await useCase.call(taskEntity: taskEntity);
    expect(result, Left(error));

    verify(() => repository.updateTask(taskEntity: taskEntity)).called(1);
  });
}
