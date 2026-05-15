import 'package:flutter/material.dart';

class PaddedCard extends StatelessWidget {
  final Widget child;
  final Color? color;
  final double? elevation;
  final Clip? clipBehavior;
  final Decoration? decoration;
  final double verticalPadding;

  const PaddedCard({
    super.key,
    required this.child,
    this.color,
    this.elevation,
    this.clipBehavior,
    this.decoration,
    this.verticalPadding = 30,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      color: color,
      elevation: elevation,
      clipBehavior: clipBehavior,
      child: Container(
        decoration: decoration,
        padding: EdgeInsets.symmetric(
          horizontal: 20,
          vertical: verticalPadding,
        ),
        child: child,
      ),
    );
  }
}
