import 'package:flutter/material.dart';
import 'package:training_task1/core/values/constants.dart';
import 'package:training_task1/core/widgets/icon_widget.dart';

class LabeledIconWidget extends StatelessWidget {
  const LabeledIconWidget(
      {super.key,
      required this.pathSvg,
      required this.text,
      this.color,
      this.press});
  final String pathSvg;
  final String text;
  final VoidCallback? press;
  final Color? color;
  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.transparent,
      child: InkWell(
        onTap: press,
        child: Row(
          children: [
            IconWidget(
              path: pathSvg,
            ),
            Text(
              text,
              style: textTheme(16, null, color ?? Colors.white),
            )
          ],
        ),
      ),
    );
  }
}
