import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:training_task1/core/values/colors.dart';
import 'package:training_task1/core/values/constants.dart';
import 'package:training_task1/domain/entities/task.dart';
import 'package:training_task1/features/home/controllers/home_controller.dart';
import 'package:training_task1/features/tasks/controllers/edit_task_controller.dart';
import 'package:training_task1/features/tasks/widgets/labeled_icon_widget.dart';

class EditTimeWidget extends StatelessWidget {
  EditTimeWidget(
      {super.key,
      required this.pathSvg,
      required this.task,
      required this.onPressed});
  final String pathSvg;

  final Task task;
  final VoidCallback onPressed;
  final editController = Get.find<EditTaskController>();
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        LabeledIconWidget(
          pathSvg: pathSvg,
          text: 'Task Time:',
          press: onPressed,
        ),
        Obx(() {
          return ClipRRect(
            borderRadius: BorderRadius.circular(4),
            child: Container(
              color: greyShadow,
              padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 12),
              child: Row(
                children: [
                  Text(
                    editController.dateIsUpdated.value
                        ? editController.formatUpdatedDate()
                        : '${Get.find<HomeController>().formatDay(task)} At ${task.time}',
                    style: textTheme(12, null, null),
                  )
                ],
              ),
            ),
          );
        })
      ],
    );
  }
}
