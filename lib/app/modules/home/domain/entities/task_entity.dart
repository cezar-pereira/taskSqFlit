class TaskEntity {
  final String id;
  final String name;
  final bool isDone;
  final DateTime date;

  TaskEntity(
      {this.id = '',
      required this.name,
      this.isDone = false,
      required this.date});

  bool get isValidName => name.length >= 5 && name.length <= 50;
}
