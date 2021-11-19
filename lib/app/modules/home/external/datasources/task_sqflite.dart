import 'package:sqflite/sqflite.dart';
import 'package:todolist_flutter/app/modules/home/domain/entities/task_entity.dart';
import 'package:todolist_flutter/app/modules/home/infra/datasourcers/task_datasource.dart';
import 'package:todolist_flutter/app/modules/home/infra/models/task_model.dart';
import 'package:todolist_flutter/app/utils/database/database_sqflite.dart';
import 'dart:developer' as dev;

class TaskDataSource implements TaskDataSourceInterface {
  @override
  Future<List<TaskModel>> fetchTasks() async {
    Database _database = await SqfliteDB.instance.database;
    var data = await _database.query('tasks');

    return data.map((e) => TaskModel.fromMapSqlFlite(map: e)).toList();
  }

  @override
  Future<bool> removeTask({required TaskEntity task}) async {
    Database _database = await SqfliteDB.instance.database;
    try {
      var result = await _database
          .delete('tasks', where: 'id = ?', whereArgs: [int.parse(task.id)]);
      return result > 0 ? true : false;
    } catch (e) {
      return false;
    }
  }

  @override
  Future<bool> saveTask({required TaskEntity task}) {
    // TODO: implement saveTask
    throw UnimplementedError();
  }

  @override
  Future<bool> updateTask({required TaskModel task}) async {
    Database _database = await SqfliteDB.instance.database;

    var result = await _database.update('tasks', task.toMapSqlFlite(),
        where: 'id = ?', whereArgs: [task.id]);

    return result > 0 ? true : false;
  }
}
