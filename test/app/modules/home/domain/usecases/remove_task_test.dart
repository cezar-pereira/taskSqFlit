import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:todolist_flutter/app/modules/home/domain/errors/errors.dart';
import 'package:todolist_flutter/app/modules/home/domain/repositories/task_repository.dart';
import 'package:todolist_flutter/app/modules/home/domain/usecases/task/remove_task.dart';
import 'package:todolist_flutter/app/modules/home/infra/models/task_model.dart';

class UserRepositoryMock extends Mock implements TaskRepositoryInterface {}

void main() {
  late final TaskRepositoryInterface repository;
  late final RemoveTaskInterface useCase;
  late final TaskModel task;
  setUpAll(() {
    task =
        TaskModel(name: 'Name', date: DateTime.now(), id: '1', isDone: false);
    repository = UserRepositoryMock();
    useCase = RemoveTask(repository: repository);
  });

  test('Should return TRUE', () async {
    bool status = true;
    when(() => repository.removeTask(task: task))
        .thenAnswer((_) async => Right(status));
    var result = await useCase.call(task: task);
    expect(result, Right(status));
    verify(() => repository.removeTask(task: task)).called(1);
  });

  test('Should return a ERROR when removeTask', () async {
    var error = ErrorRemoveTaskEntity(message: 'error');
    when(() => repository.removeTask(task: task))
        .thenAnswer((_) async => Left(error));
    var result = await useCase.call(task: task);
    expect(result, Left(error));

    verify(() => repository.removeTask(task: task)).called(1);
  });
}
