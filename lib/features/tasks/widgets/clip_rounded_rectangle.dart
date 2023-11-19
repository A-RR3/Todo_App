import 'dart:ui';

import 'package:flutter/material.dart';

class ClipRoundedRectangle extends StatelessWidget {
  const ClipRoundedRectangle(
      {super.key,
      required this.press,
      required this.child,
      required this.color});
  final VoidCallback press;
  final Widget child;
  final Color color;
  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.transparent,
      child: InkWell(
          onTap: press,
          child: Container(
              padding: const EdgeInsets.all(5),
              decoration: BoxDecoration(
                color: color,
                borderRadius: BorderRadius.circular(4),
              ),
              child: child)),
    );
  }
}
