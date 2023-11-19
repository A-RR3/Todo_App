import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:training_task1/core/values/colors.dart';
import 'package:training_task1/core/values/constants.dart';
import 'package:training_task1/domain/entities/categories.dart';
import 'package:training_task1/domain/entities/task.dart';
import 'package:training_task1/features/home/controllers/home_controller.dart';
import 'package:training_task1/features/tasks/controllers/edit_task_controller.dart';
import 'package:training_task1/features/tasks/widgets/labeled_icon_widget.dart';

class EditCategoryWidget extends StatelessWidget {
  EditCategoryWidget(
      {super.key,
      required this.pathSvg,
      required this.text,
      required this.task,
      required this.onPressed});
  final String pathSvg;
  final String text;
  final Task task;
  final VoidCallback onPressed;
  final editController = Get.find<EditTaskController>();
  final homeController = Get.find<HomeController>();

  @override
  Widget build(BuildContext context) {
    Category category = homeController.categoriesList
        .firstWhere((element) => element.id == task.categoryId);
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        LabeledIconWidget(
          pathSvg: pathSvg,
          text: text,
          press: onPressed,
        ),
        GetBuilder<EditTaskController>(
            id: 'category',
            builder: (context) => ClipRRect(
                  borderRadius: BorderRadius.circular(4),
                  child: Container(
                    color: greyShadow,
                    padding:
                        const EdgeInsets.symmetric(horizontal: 12, vertical: 5),
                    child: Row(
                      children: [
                        Icon(
                          editController.categoryIsUpdated
                              ? editController.category.icon
                              : category.icon,
                          size: 30,
                        ),
                        const SizedBox(
                          width: 5,
                        ),
                        Text(
                          editController.categoryIsUpdated
                              ? editController.category.name
                              : category.name,
                          style: textTheme(16, null, null),
                        )
                      ],
                    ),
                  ),
                ))
      ],
    );
  }
}
