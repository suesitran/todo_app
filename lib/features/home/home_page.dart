import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:todo_app/features/home/cubit/home_cubit.dart';
import 'package:todo_app/features/home/widget/add_new_task_bottom_sheet.dart';
import 'package:todo_app/features/home/widget/date_and_summary_view.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider<HomeCubit>(
      create: (context) => HomeCubit(),
      child: const _HomePageConsumer(),
    );
  }
}

class _HomePageConsumer extends StatelessWidget {
  const _HomePageConsumer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) => BlocConsumer<HomeCubit, HomeState>(
    listener: (context, state) {
      if (state is HomeDataSaving) {
        // show full screen progress dialog
        showDialog(context: context, builder: (context) => const SimpleDialog(
          backgroundColor: Colors.transparent,
          children: [
            Center(
              child: CircularProgressIndicator.adaptive(),
            )
          ],
        ),);
      }

      if (state is HomeDataSaved) {
        Navigator.of(context).pop();
      }
    },
    builder: (context, state) {
      List<Task> incomplete = [];
      List<Task> completed = [];

      if (state is HomeDataLoaded) {
        incomplete = state.incomplete;
        completed = state.completed;
      }
      return Scaffold(
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            // when tapping on floating action button, open bottom sheet to add new task
            showModalBottomSheet(
              context: context,
              builder: (_) => AddNewTaskBottomSheet(
                  onSave: (description) {
                    context.read<HomeCubit>().saveTask(description);
                  }
              )
            );
          },
          backgroundColor: Theme.of(context).primaryColor,
          child: const Icon(Icons.add, color: Colors.white,),
        ),
        body: SafeArea(
          child: Padding(
            padding: const EdgeInsets.only(left: 16, right: 16),
            child: CustomScrollView(
              slivers: [
                SliverToBoxAdapter(
                  child: DateAndSummaryView(incompleteCount: incomplete.length, completedCount: completed.length),
                ),
                SliverToBoxAdapter(
                  child: Padding(
                    padding: const EdgeInsets.only(top: 16, bottom: 16),
                    child: Text(
                      'Incomplete',
                      style: Theme.of(context)
                          .textTheme
                          .bodyText1
                          ?.copyWith(color: const Color(0xFF575767)),
                    ),
                  ),
                ),
                SliverList(
                    delegate: SliverChildBuilderDelegate((context, index) {
                      return Padding(
                        padding: const EdgeInsets.only(bottom: 16.0),
                        child: Row(
                          children: [
                            Checkbox(
                              value: false,
                              onChanged: (value) {
                                if (value != null) {
                                  context.read<HomeCubit>().updateTask(
                                      index, incomplete[index], value);
                                }
                              },
                              materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
                            ),
                            Expanded(
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(incomplete[index].description,
                                      maxLines: 1, overflow: TextOverflow.ellipsis),
                                  Text(
                                    incomplete[index].category,
                                    maxLines: 1,
                                    overflow: TextOverflow.ellipsis,
                                  )
                                ],
                              ),
                            )
                          ],
                        ),
                      );
                    }, childCount: incomplete.length)),
                SliverToBoxAdapter(
                  child: Padding(
                    padding: const EdgeInsets.only(top: 16, bottom: 16),
                    child: Text(
                      'Completed',
                      style: Theme.of(context)
                          .textTheme
                          .bodyText1
                          ?.copyWith(color: const Color(0xFF575767)),
                    ),
                  ),
                ),
                SliverList(
                    delegate: SliverChildBuilderDelegate((context, index) {
                      return Padding(
                        padding: const EdgeInsets.only(bottom: 16.0),
                        child: Row(
                          children: [
                            Checkbox(
                              value: true,
                              onChanged: (value) {
                                if (value != null) {
                                  context.read<HomeCubit>().updateTask(
                                      index, completed[index], value);
                                }
                                },
                              materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
                            ),
                            Expanded(
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(completed[index].description,
                                      style: Theme.of(context)
                                          .textTheme
                                          .bodyText2
                                          ?.copyWith(
                                          decoration: TextDecoration.lineThrough),
                                      maxLines: 1,
                                      overflow: TextOverflow.ellipsis),
                                ],
                              ),
                            )
                          ],
                        ),
                      );
                    }, childCount: completed.length))
              ],
            ),
          ),
        ),
      );
    },
  );
}

