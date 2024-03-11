import 'package:flutter/material.dart';

class SpacerWidget extends StatelessWidget {
  final Widget child;
  final double horizontal;
  final double vertical;

  const SpacerWidget({
    super.key,
    this.horizontal = 24,
    this.vertical = 0,
    required this.child,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(
        horizontal: horizontal,
        vertical: vertical,
      ),
      child: child,
    );
  }
}
