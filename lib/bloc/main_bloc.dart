import 'package:bloc/bloc.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:meta/meta.dart';
import 'package:todo_app/data/task.dart';

part 'main_event.dart';
part 'main_state.dart';

class MainBloc extends Bloc<MainEvent, MainState> {
  MainBloc() : super(MainInitial()) {

    on<MainInitialiseEvent>(_initialise);
  }

  Future<void> _initialise(MainEvent event, Emitter<MainState> emit) async {
    emit(MainInitialiseStart());
    // init Hive
    await Hive.initFlutter();

    // register Hive TypeAdapters
    Hive.registerAdapter<Task>(TaskAdapter());

    emit(MainInitialiseDone());
  }
}
