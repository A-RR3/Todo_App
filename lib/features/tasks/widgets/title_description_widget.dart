import 'package:flutter/material.dart';
import 'package:training_task1/core/values/constants.dart';
import 'package:training_task1/domain/entities/task.dart';
import 'package:training_task1/core/widgets/icon_widget.dart';

class EditTitleSection extends StatelessWidget {
  const EditTitleSection(
      {super.key, required this.task, required this.onPress});
  final Task task;
  final VoidCallback onPress;
  // final editController = Get.find<EditTaskController>();
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 20),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Flexible(
                      flex: 6,
                      child: Text(
                        '${task.title}',
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                        style: textTheme(20, null, null),
                      ),
                    ),
                    Flexible(
                      child: IconWidget(
                        path: 'assets/icons/edit.svg',
                        press: onPress,
                        size: 40,
                      ),
                    )
                  ],
                ),
                Text(
                  '${task.description}',
                  style: textTheme(16, FontWeight.w300, null),
                ),
              ],
            ),
          ),
        )
      ],
    );
  }
}
