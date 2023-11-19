import 'package:flutter/material.dart';
import 'package:training_task1/features/tasks/widgets/labeled_icon_widget.dart';

class ShareTaskWidget extends StatelessWidget {
   ShareTaskWidget({super.key, required this.pathSvg, required this.text, required this.press});
  final String pathSvg;
  final String text;
  final VoidCallback press;
  @override
  Widget build(BuildContext context) {
    return LabeledIconWidget(
      pathSvg: pathSvg,
      text: text,
      press: press,
    );
  }
}
