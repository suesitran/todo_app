import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.only(left: 16, right: 16),
          child: CustomScrollView(
            slivers: [
              const SliverToBoxAdapter(
                child: DateAndSummaryView(),
              ),
              SliverList(delegate: SliverChildBuilderDelegate((context, index) {
                if (index == 0) {
                  return Text('Incomplete title');
                }
                return Text('Incomplete child');
              },
              childCount: 8)),
              SliverList(delegate: SliverChildBuilderDelegate((context, index) {
                if (index == 0) {
                  return Text('Completed title');
                }

                return Text('completed child')
              }))
            ],
          ),
        ),
      ),
    );
  }
}

class DateAndSummaryView extends StatelessWidget {
  const DateAndSummaryView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text('March 9, 2020', style: Theme.of(context).textTheme.headline4,)
      ],
    );
  }
}

