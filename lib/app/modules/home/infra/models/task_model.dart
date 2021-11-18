import 'package:todolist_flutter/app/modules/home/domain/entities/task_entity.dart';

class TaskModel extends TaskEntity {
  TaskModel(
      {required String id,
      required String name,
      required DateTime date,
      required bool isDone})
      : super(name: name, date: date);

  factory TaskModel.fromMap({required map}) {
    return TaskModel(
      id: map['id'],
      name: map['name'],
      isDone: map['isDone'],
      date: map['date'],
    );
  }

  TaskModel copyWith({String? name, DateTime? date, bool? isDone}) {
    return TaskModel(
        id: id,
        name: name ?? this.name,
        date: date ?? this.date,
        isDone: isDone ?? this.isDone);
  }

  Map<String, dynamic> toMapSqlLite() {
    return {
      'id': id,
      'name': name,
      'isDone': isDone ? 1 : 0,
      'date': date.toIso8601String(),
    };
  }
}
