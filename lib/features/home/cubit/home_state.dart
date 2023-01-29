part of 'home_cubit.dart';

@immutable
abstract class HomeState {}

class HomeInitial extends HomeState {}

class HomeDataLoaded extends HomeState {
  final List<Task> incomplete;
  final List<Task> completed;

  HomeDataLoaded({required this.incomplete, required this.completed});
}
