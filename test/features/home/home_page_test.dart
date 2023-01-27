import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:todo_app/features/home/home_page.dart';

import '../../widget_tester_extension.dart';

void main() {
  group('Verify static UI', () {
    testWidgets('Verify static UI without bloc', (widgetTester) async {
      const HomePage homePage = HomePage();

      await widgetTester.wrapAndPump(homePage);

      // title for Incomplete and Completed list must be found
      expect(find.text('Incomplete'), findsOneWidget);
      expect(find.text('Completed'), findsOneWidget);

      // floating button must present
      expect(find.byType(FloatingActionButton), findsOneWidget);
    });
  });
}
