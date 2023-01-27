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
                  return Text('Incomplete');
                }
                return Text('Incomplete child');
              },
              childCount: 5)),
              SliverList(delegate: SliverChildBuilderDelegate((context, index) {
                if (index == 0) {
                  return Text('Completed title');
                }

                return Text('completed child');
              },
              childCount: 5))
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
        Text('March 9, 2020', style: Theme.of(context).textTheme.headline4?.copyWith(color: const Color(0xFF0E0E11), fontWeight: FontWeight.w900),),
        const SizedBox(height: 8.0,),
        Text('5 incomplete, 5 completed', style: Theme.of(context).textTheme.bodyText1?.copyWith(color: const Color(0xFF575767), fontWeight: FontWeight.w400),),
        const SizedBox(height: 16.0,),
        const Divider(height: 1.0,),
        const SizedBox(height: 16.0,)
      ],
    );
  }
}

