import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:todolist_flutter/app/modules/home/infra/models/task_model.dart';

import 'create_edit_task_controller.dart';

class CreateEditTaskPage extends StatefulWidget {
  final TaskModel? task;
  const CreateEditTaskPage({Key? key, this.task}) : super(key: key);

  @override
  State<CreateEditTaskPage> createState() => _CreateEditTaskPageState();
}

class _CreateEditTaskPageState extends State<CreateEditTaskPage> {
  late final CreateEditTaskController controller = Modular.get();

  @override
  void initState() {
    controller.setDate();
    super.initState();
    if (widget.task != null) {
      controller.setValuesTask(task: widget.task);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.task != null ? 'Atualizar' : 'Adicionar'),
      ),
      body: Column(
        children: [
          TextField(
            decoration: InputDecoration(hintText: 'Nome da tarefa'),
            controller: controller.nameController,
          ),
          Row(
            children: [
              Expanded(
                child: TextField(
                  // decoration: InputDecoration(hintText: 'Nome da tarefa'),
                  controller: controller.dateController,
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: ElevatedButton(
                  onPressed: () async {
                    _selectDate(context);
                  },
                  child: Text('Selecionar'),
                ),
              )
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              ElevatedButton(
                onPressed: () async {
                  Modular.to.pop(false);
                },
                child: Text('Cancelar'),
              ),
              ElevatedButton(
                onPressed: () async {
                  if (widget.task == null) {
                    controller.createTask();
                  } else {
                    controller.updateTask(task: widget.task);
                  }
                  Modular.to.pop(true);
                },
                child: Text('Confirmar'),
              ),
            ],
          )
        ],
      ),
    );
  }

  Future<void> _selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
        context: context,
        initialDate: controller.selectedDate,
        firstDate: widget.task != null ? widget.task!.date : DateTime(2000, 8),
        lastDate: DateTime(2101));
    if (picked != null && picked != controller.selectedDate) {
      setState(() {
        controller.selectedDate = picked;
        controller.setDate();
      });
    }
  }
}
