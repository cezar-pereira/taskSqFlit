import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:todolist_flutter/app/modules/home/domain/usecases/task/fetch_tasks.dart';
import 'package:todolist_flutter/app/modules/home/domain/usecases/task/remove_task.dart';
import 'package:todolist_flutter/app/modules/home/domain/usecases/task/update_task.dart';
import 'package:todolist_flutter/app/modules/home/infra/models/task_model.dart';

class CounterCubit extends Cubit<List<TaskModel>> {
  final FetchTasksInterface fetchTasksUsecase;
  final RemoveTaskInterface removeTasksUsecase;
  final UpdateTaskInterface updateTasksUsecase;
  CounterCubit(
      {required this.fetchTasksUsecase,
      required this.removeTasksUsecase,
      required this.updateTasksUsecase})
      : super([]);

  Future<void> fetchTasks() async {
    var items = await fetchTasksUsecase.call();
    items.fold((l) => null, (items) {
      emit(items);
    });
  }

  Future<void> removeTask({required TaskModel task}) async {
    var result = await removeTasksUsecase.call(task: task);
    result.fold((l) => null, (r) => fetchTasks());
  }

  Future<void> updateStatus({required TaskModel task}) async {
    task = task.copyWith(isDone: !task.isDone);
    var result = await updateTasksUsecase.call(task: task);
    result.fold((l) => null, (r) => fetchTasks());
  }
}
