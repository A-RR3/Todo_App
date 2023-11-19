import 'package:flutter/material.dart';
import 'package:training_task1/core/values/constants.dart';

class LabeledWidget extends StatelessWidget {
  const LabeledWidget(
      {super.key, required this.label, this.controller, required this.widget});
  final String label;
  final Widget widget;
  final TextEditingController? controller;
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: textTheme(16, null, null),
        ),
        const SizedBox(
          height: 20,
        ),
        Container(
          margin: const EdgeInsets.only(right: 20),
          child: widget,
        ),
        const SizedBox(
          height: 20,
        )
      ],
    );
  }
}
