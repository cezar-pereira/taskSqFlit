import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:todolist_flutter/app/modules/home/domain/entities/task_entity.dart';

class CardTaskComponent extends StatelessWidget {
  final TaskEntity task;
  const CardTaskComponent({Key? key, required this.task}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        borderRadius: BorderRadius.only(
            topLeft: Radius.circular(4),
            topRight: Radius.circular(4),
            bottomLeft: Radius.circular(4),
            bottomRight: Radius.circular(4)),
        boxShadow: [
          BoxShadow(color: Colors.black12, blurRadius: 6),
        ],
        color: Colors.white,
      ),
      margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
      height: 50,
      width: double.maxFinite,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(task.name),
          Text(_formatDate(date: task.date)),
        ],
      ),
    );
  }

  String _formatDate({required DateTime date}) {
    final DateFormat formatter = DateFormat('dd MMM');
    final String formatted = formatter.format(date);
    return formatted;
  }
}
