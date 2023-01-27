import 'package:flutter_test/flutter_test.dart';
import 'package:flutter/material.dart';

extension WidgetTesterExtension on WidgetTester {
  Future<void> wrapAndPump(Widget widget,
      {bool infiniteAnimationWidget = false}) async {
    final Widget wrapper = _MaterialWrapWidget(child: widget);

    await pumpWidget(wrapper);
    if (infiniteAnimationWidget) {
      await pump();
    } else {
      await pumpAndSettle();
    }
  }
}

class _MaterialWrapWidget extends StatelessWidget {
  final Widget child;

  const _MaterialWrapWidget({required this.child, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: child,
      ),
    );
  }
}
