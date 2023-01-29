import 'package:bloc/bloc.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:meta/meta.dart';
import 'package:todo_app/data/task.dart';

part 'main_event.dart';
part 'main_state.dart';

class MainBloc extends Bloc<MainEvent, MainState> {
  MainBloc() : super(MainInitial()) {
    _initialise();

    on<MainEvent>((event, emit) {
    });
  }

  Future<void> _initialise() async {
    // init Hive
    await Hive.initFlutter();

    // register Hive TypeAdapters
    Hive.registerAdapter(TaskAdapter());
  }
}
