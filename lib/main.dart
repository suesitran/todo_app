import 'package:flutter/material.dart';
import 'package:todo_app/bloc/main_bloc.dart';
import 'package:todo_app/features/home/home_page.dart';
import 'package:todo_app/theme/color.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return BlocProvider<MainBloc>(
      create: (context) => MainBloc(),
      child: MaterialApp(
        title: 'Todo App Demo',
        // The UI has dark and light theme, but for this demo, we're going to use only light theme
        theme: ThemeData(
          primarySwatch: primarySwatch,
        ),
        home: const HomePage(),
      ),
    );
  }
}
