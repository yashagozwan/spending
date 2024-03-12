import 'package:flutter/material.dart';

class TouchableWidget extends StatelessWidget {
  final Widget child;
  final void Function()? onPressed;
  final double rounded;

  const TouchableWidget({
    super.key,
    required this.child,
    this.onPressed,
    this.rounded = 16,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        child,
        Positioned.fill(
          child: Material(
            clipBehavior: Clip.hardEdge,
            borderRadius: BorderRadius.circular(rounded),
            color: Colors.transparent,
            child: InkWell(
              onTap: onPressed,
            ),
          ),
        ),
      ],
    );
  }
}
