import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todolist_flutter/app/modules/home/domain/entities/task_entity.dart';
import 'package:todolist_flutter/app/modules/home/domain/usecases/task/fetch_tasks.dart';

class CounterCubit extends Cubit<List<TaskEntity>> {
  final FetchTasksInterface fetchTasksUsecase;
  CounterCubit({required this.fetchTasksUsecase}) : super([]);

  Future<void> fetchTasks() async {
    var items = await fetchTasksUsecase.call();

    items.fold((l) => null, (items) {
      emit(items);
    });
  }
}
