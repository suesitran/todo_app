import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class DateAndSummaryView extends StatelessWidget {
  final int incompleteCount;
  final int completedCount;
  const DateAndSummaryView({required this.incompleteCount, required this.completedCount, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          DateFormat('MMMM dd, yyyy').format(DateTime.now()),
          style: Theme.of(context).textTheme.headline4?.copyWith(
              color: const Color(0xFF0E0E11), fontWeight: FontWeight.w900),
        ),
        const SizedBox(
          height: 8.0,
        ),
        Text(
          '$incompleteCount incomplete, $completedCount completed',
          style: Theme.of(context).textTheme.bodyText1?.copyWith(
              color: const Color(0xFF575767), fontWeight: FontWeight.w400),
        ),
        const SizedBox(
          height: 16.0,
        ),
        const Divider(
          height: 1.0,
        ),
      ],
    );
  }
}