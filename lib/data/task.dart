import 'package:hive/hive.dart';

part 'task.g.dart';

@HiveType(typeId: 0)
class Task {
  @HiveField(0)
  String description;

  @HiveField(1)
  String category;

  @HiveField(2, defaultValue: false)
  bool isCompleted;

  Task({required this.description, required this.category, required this.isCompleted});
}