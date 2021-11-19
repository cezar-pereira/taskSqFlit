// ignore_for_file: prefer_const_constructors, use_key_in_widget_constructors
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:todolist_flutter/app/modules/home/domain/entities/task_entity.dart';

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
        onPressed: _tasksCubit.fetchTasks,
      ),
      body: Center(
        child: BlocBuilder<CounterCubit, List<TaskEntity>>(
          bloc: _tasksCubit,
          builder: (context, list) {
            if (list.isEmpty) {
              return Text('Lista vazia');
            } else {
              return ListView.builder(
                itemCount: list.length,
                itemBuilder: (context, index) {
                  return Text(list[index].name);
                },
              );
            }
          },
        ),
      ),
    );
  }
}
