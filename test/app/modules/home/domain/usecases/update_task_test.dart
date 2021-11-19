import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:todolist_flutter/app/modules/home/domain/errors/errors.dart';
import 'package:todolist_flutter/app/modules/home/domain/repositories/task_repository.dart';
import 'package:todolist_flutter/app/modules/home/domain/usecases/task/update_task.dart';
import 'package:todolist_flutter/app/modules/home/infra/models/task_model.dart';

class TaskRepositoryMock extends Mock implements TaskRepositoryInterface {}

void main() {
  late final TaskRepositoryInterface repository;
  late final UpdateTaskInterface useCase;
  late final TaskModel task;
  setUpAll(() {
    task =
        TaskModel(name: 'Name', date: DateTime.now(), id: '1', isDone: false);
    repository = TaskRepositoryMock();
    useCase = UpdateTask(repository: repository);
  });

  test('Should return TRUE', () async {
    bool status = true;
    when(() => repository.updateTask(task: task))
        .thenAnswer((_) async => Right(status));

    var result = await useCase.call(task: task);
    expect(result, Right(status));
    verify(() => repository.updateTask(task: task)).called(1);
  });

  test('Should return a ERROR when updateTask', () async {
    var error = ErrorUpdateTaskEntity(message: 'error');
    when(() => repository.updateTask(task: task))
        .thenAnswer((_) async => Left(error));
    var result = await useCase.call(task: task);
    expect(result, Left(error));

    verify(() => repository.updateTask(task: task)).called(1);
  });
}
