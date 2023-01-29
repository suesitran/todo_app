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

  @HiveField(3)
  int key;

  Task({required this.description, required this.category, required this.isCompleted, required this.key});

  Task.copyWith(Task other, {String? description, String? category, bool? isCompleted}) :
      key = other.key,
  description = description ?? other.description,
        category = category ?? other.category,
  isCompleted = isCompleted ?? other.isCompleted;
}