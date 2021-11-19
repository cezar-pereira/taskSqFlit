import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todolist_flutter/app/modules/home/domain/entities/task_entity.dart';
import 'package:todolist_flutter/app/modules/home/domain/usecases/task/fetch_tasks.dart';
import 'package:todolist_flutter/app/modules/home/domain/usecases/task/remove_task.dart';

class CounterCubit extends Cubit<List<TaskEntity>> {
  final FetchTasksInterface fetchTasksUsecase;
  final RemoveTaskInterface removeTasksUsecase;

  CounterCubit(
      {required this.fetchTasksUsecase, required this.removeTasksUsecase})
      : super([]);

  Future<void> fetchTasks() async {
    var items = await fetchTasksUsecase.call();
    items.fold((l) => null, (items) {
      emit(items);
    });
  }

  Future<void> removeTask({required TaskEntity task}) async {
    var result = await removeTasksUsecase.call(taskEntity: task);
    result.fold((l) => null, (r) => fetchTasks());
  }
}
