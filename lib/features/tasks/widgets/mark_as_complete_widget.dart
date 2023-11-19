import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:training_task1/core/values/colors.dart';
import 'package:training_task1/core/values/constants.dart';
import 'package:training_task1/features/tasks/widgets/clip_rounded_rectangle.dart';

class MarkAsComplete extends StatelessWidget {
  const MarkAsComplete({super.key, required this.onPressed});
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        ClipRoundedRectangle(
          press: () => Get.back(),
          color: greyShadow.withOpacity(.5),
          child: const Icon(
            Icons.close,
            size: 18,
          ),
        ),
        ClipRoundedRectangle(
          press: onPressed,
          color: greyShadow.withOpacity(.5),
          child: Text(
            'Mark as complete',
            style: textTheme(12, FontWeight.w700, null),
          ),
        )
      ],
    );
  }
}
