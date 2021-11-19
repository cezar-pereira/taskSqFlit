import 'package:todolist_flutter/app/modules/home/domain/entities/task_entity.dart';

class TaskModel extends TaskEntity {
  TaskModel(
      {required String id,
      required String name,
      required bool isDone,
      required DateTime date})
      : super(name: name, date: date);

  factory TaskModel.fromMapSqlFlite({required map}) {
    return TaskModel(
      id: map['id'].toString(),
      name: map['name'],
      isDone: map['isDone'] == 0 ? false : true,
      date: DateTime.fromMillisecondsSinceEpoch(map['date']),
    );
  }

  TaskModel copyWith({String? name, DateTime? date, bool? isDone}) {
    return TaskModel(
        id: id,
        name: name ?? this.name,
        isDone: isDone ?? this.isDone,
        date: date ?? this.date);
  }

  Map<String, dynamic> toMapSqlFlite() {
    return {
      'name': name,
      'isDone': isDone ? 1 : 0,
      'date': date.millisecondsSinceEpoch,
    };
  }
}
