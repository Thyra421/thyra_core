import 'package:flutter/material.dart';

class NoOverscrollBehaviour extends ScrollBehavior {
  @override
  Widget buildOverscrollIndicator(
    BuildContext context,
    Widget child,
    ScrollableDetails details,
  ) =>
      child;
}

class NoIndicatorScroll extends StatelessWidget {
  const NoIndicatorScroll({required this.child, super.key});

  final Widget child;

  @override
  Widget build(BuildContext context) => ScrollConfiguration(
        behavior: NoOverscrollBehaviour(),
        child: child,
      );
}
