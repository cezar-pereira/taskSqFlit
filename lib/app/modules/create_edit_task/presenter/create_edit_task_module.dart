import 'package:flutter_modular/flutter_modular.dart';
import 'package:todolist_flutter/app/modules/create_edit_task/presenter/create_edit_task_controller.dart';
import 'package:todolist_flutter/app/modules/home/domain/repositories/task_repository.dart';
import 'package:todolist_flutter/app/modules/home/domain/usecases/task/save_task.dart';
import 'package:todolist_flutter/app/modules/home/domain/usecases/task/update_task.dart';
import 'package:todolist_flutter/app/modules/home/external/datasources/task_sqflite.dart';
import 'package:todolist_flutter/app/modules/home/infra/datasourcers/task_datasource.dart';
import 'package:todolist_flutter/app/modules/home/infra/repositories/task_repository.dart';
import 'create_edit_task_page.dart';

class CreateEditTaskModule extends Module {
  @override
  final List<Bind> binds = [
    Bind.lazySingleton((i) => CreateEditTaskController(
        updateTasksUsecase: i.get<UpdateTaskInterface>(),
        saveTaskUsecase: i.get<SaveTaskInterface>())),

    //DATASOURCES
    Bind.lazySingleton((i) => TaskDataSource()),

    //REPOSITORIES
    Bind.lazySingleton(
        (i) => TaskRepository(dataSource: i.get<TaskDataSourceInterface>())),

    //USECASES

    Bind.lazySingleton(
        (i) => UpdateTask(repository: i.get<TaskRepositoryInterface>())),
    Bind.lazySingleton(
        (i) => SaveTask(repository: i.get<TaskRepositoryInterface>())),
  ];
  @override
  final List<ModularRoute> routes = [
    ChildRoute(Modular.initialRoute,
        child: (context, args) => CreateEditTaskPage(task: args.data)),
  ];
}
