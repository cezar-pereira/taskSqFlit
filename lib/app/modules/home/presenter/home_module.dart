import 'package:flutter_modular/flutter_modular.dart';
import 'package:todolist_flutter/app/modules/home/domain/repositories/task_repository.dart';
import 'package:todolist_flutter/app/modules/home/domain/usecases/task/fetch_tasks.dart';
import 'package:todolist_flutter/app/modules/home/external/datasources/task_sqflite.dart';
import 'package:todolist_flutter/app/modules/home/infra/datasourcers/task_datasource.dart';
import 'package:todolist_flutter/app/modules/home/infra/repositories/task_repository.dart';

import 'task_cubit.dart';
import 'home_page.dart';

class HomeModule extends Module {
  @override
  final List<Bind> binds = [
    Bind.lazySingleton(
        (i) => CounterCubit(fetchTasksUsecase: i.get<FetchTasksInterface>())),

    //DATASOURCES
    Bind.lazySingleton((i) => TaskDataSource()),

    //REPOSITORIES
    Bind.lazySingleton(
        (i) => TaskRepository(dataSource: i.get<TaskDataSourceInterface>())),

    //USECASES
    Bind.lazySingleton(
        (i) => FetchTasks(repository: i.get<TaskRepositoryInterface>()))
  ];

  @override
  final List<ModularRoute> routes = [
    ChildRoute(Modular.initialRoute, child: (context, args) => HomePage()),
  ];
}
