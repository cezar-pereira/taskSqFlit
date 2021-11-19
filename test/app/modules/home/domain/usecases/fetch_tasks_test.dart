import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:todolist_flutter/app/modules/home/domain/errors/errors.dart';
import 'package:todolist_flutter/app/modules/home/domain/repositories/task_repository.dart';
import 'package:todolist_flutter/app/modules/home/domain/usecases/task/fetch_tasks.dart';
import 'package:todolist_flutter/app/modules/home/infra/models/task_model.dart';

class UserRepositoryMock extends Mock implements TaskRepositoryInterface {}

void main() {
  late final TaskRepositoryInterface repository;
  late final FetchTasksInterface useCase;

  setUpAll(() {
    repository = UserRepositoryMock();
    useCase = FetchTasks(repository: repository);
  });

  test('Should return a List<TaskEntity>', () async {
    List<TaskModel> list = [];
    when(() => repository.fetchTasks()).thenAnswer((_) async => Right(list));

    var result = await useCase.call();
    expect(result, Right(list));
    verify(() => repository.fetchTasks()).called(1);
  });

  test('Should retunr a ERROR when fetchTasks', () async {
    var error = ErrorFetchTaskEntity(message: 'error');
    when(() => repository.fetchTasks()).thenAnswer((_) async => Left(error));
    var result = await useCase.call();
    expect(result, Left(error));

    verify(() => repository.fetchTasks()).called(1);
  });
}
