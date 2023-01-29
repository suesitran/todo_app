import 'package:bloc/bloc.dart';
import 'package:hive/hive.dart';
import 'package:meta/meta.dart';

import 'package:todo_app/data/task.dart';

part 'home_state.dart';

class HomeCubit extends Cubit<HomeState> {
  final String taskBoxName = 'taskBox';

  HomeCubit() : super(HomeInitial()) {
    _loadDataFromHive();
  }

  Future<void> _loadDataFromHive() async {
    final Box<Task> taskBox = await Hive.openBox(taskBoxName);

    final Iterable<Task> tasks = taskBox.values.toList();

    final List<Task> incomplete = tasks.where((element) => !element.isCompleted).toList();
    final List<Task> completed = tasks.where((element) => element.isCompleted).toList();

    // close the box
    await taskBox.close();

    emit(HomeDataLoaded(incomplete: incomplete, completed: completed));
  }
}
