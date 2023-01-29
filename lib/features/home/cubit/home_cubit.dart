import 'dart:io';

import 'package:bloc/bloc.dart';
import 'package:hive/hive.dart';
import 'package:meta/meta.dart';
import 'package:path_provider/path_provider.dart';

import 'package:todo_app/data/task.dart';
export 'package:todo_app/data/task.dart';

part 'home_state.dart';

class HomeCubit extends Cubit<HomeState> {
  final String taskBoxName = 'taskBox';

  HomeCubit() : super(HomeInitial()) {
    _loadDataFromHive();
  }

  Future<void> _loadDataFromHive() async {
    final Directory directory = await getApplicationSupportDirectory();

    final Box<Task> taskBox = await Hive.openBox(taskBoxName, path: directory.path);

    final Iterable<Task> tasks = taskBox.values.toList();

    final List<Task> incomplete = tasks.where((element) => !element.isCompleted).toList();
    final List<Task> completed = tasks.where((element) => element.isCompleted).toList();

    // close the box
    await taskBox.close();

    emit(HomeDataLoaded(incomplete: incomplete, completed: completed));
  }

  Future<void> saveTask(String description) async {
    emit(HomeDataSaving());
    final Directory directory = await getApplicationSupportDirectory();
    final Box<Task> taskBox = await Hive.openBox(taskBoxName, path: directory.path);

    int key = taskBox.length;
    taskBox.put(key, Task(description: description, category: '', isCompleted: false, key: key));

    await taskBox.flush();

    await taskBox.close();

    emit(HomeDataSaved());

    await _loadDataFromHive();
  }

  Future<void> updateTask(int index, Task task, bool isCompleted) async {
    emit(HomeDataSaving());
    final Directory directory = await getApplicationSupportDirectory();
    final Box<Task> taskBox = await Hive.openBox(taskBoxName, path: directory.path);

    task.isCompleted = isCompleted;

    taskBox.delete(task.key);
    taskBox.put(task.key, task);

    await taskBox.flush();

    await taskBox.close();

    emit(HomeDataSaved());

    await _loadDataFromHive();
  }
}
