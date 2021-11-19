// ignore_for_file: prefer_const_constructors, use_key_in_widget_constructors
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:todolist_flutter/app/modules/home/infra/models/task_model.dart';
import 'package:todolist_flutter/app/modules/home/presenter/components/card_task_component.dart';

import 'task_cubit.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final CounterCubit _tasksCubit = Modular.get();

  @override
  void dispose() {
    _tasksCubit.close();
    super.dispose();
  }

  @override
  void initState() {
    _tasksCubit.fetchTasks();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Tasks")),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: () {
          Modular.to.pushNamed('/create_update-task/').then((value) {
            if (value == true) {
              _tasksCubit.fetchTasks();
            }
          });
        },
      ),
      body: Center(
        child: BlocBuilder<CounterCubit, List<TaskModel>>(
          bloc: _tasksCubit,
          builder: (context, list) {
            if (list.isEmpty) {
              return Text('Lista vazia');
            } else {
              return ListView.separated(
                padding: const EdgeInsets.all(10),
                itemCount: list.length,
                itemBuilder: (context, index) {
                  return Slidable(
                    child: CardTaskComponent(task: list[index]),
                    endActionPane: ActionPane(
                      extentRatio: 1,
                      motion: const StretchMotion(),
                      children: [
                        SlidableAction(
                          autoClose: false,
                          icon: list[index].isDone
                              ? Icons.remove_done_rounded
                              : Icons.done_all_rounded,
                          backgroundColor: Colors.transparent,
                          foregroundColor:
                              list[index].isDone ? Colors.red : Colors.green,
                          label: list[index].isDone ? 'Concluir' : 'Feito',
                          onPressed: (context) {
                            setState(() {
                              _tasksCubit.updateStatus(task: list[index]);
                            });
                          },
                        ),
                        SlidableAction(
                          icon: Icons.edit_outlined,
                          backgroundColor: Colors.transparent,
                          foregroundColor: Theme.of(context).primaryColor,
                          label: 'Editar',
                          onPressed: (context) {
                            Modular.to
                                .pushNamed('/create_update-task/',
                                    arguments: list[index])
                                .then((value) {
                              if (value == true) {
                                _tasksCubit.fetchTasks();
                              }
                            });
                          },
                        ),
                        SlidableAction(
                          icon: Icons.delete_outline,
                          backgroundColor: Colors.transparent,
                          foregroundColor: Colors.red,
                          label: 'Remover',
                          onPressed: (context) {
                            setState(() {
                              _tasksCubit.removeTask(task: list[index]);
                            });
                          },
                        ),
                      ],
                    ),
                  );
                },
                separatorBuilder: (context, index) => SizedBox(height: 10),
              );
            }
          },
        ),
      ),
    );
  }
}
