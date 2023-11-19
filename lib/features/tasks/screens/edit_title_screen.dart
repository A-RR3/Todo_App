import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:training_task1/core/values/colors.dart';
import 'package:training_task1/core/values/constants.dart';
import 'package:training_task1/domain/entities/task.dart';
import 'package:training_task1/features/categories/widgets/material_botton.dart';
import 'package:training_task1/features/tasks/controllers/edit_task_controller.dart';
import 'package:training_task1/widgets/common_text_field.dart';

class EditTaskTitle extends StatelessWidget {
  EditTaskTitle({super.key, required this.task});
  final Task task;
  final editController = Get.find<EditTaskController>();
  @override
  Widget build(BuildContext context) {
    return SimpleDialog(
      contentPadding: const EdgeInsets.fromLTRB(20, 12, 20, 0),
      title: const Text('Edit task title'),
      titleTextStyle: textTheme(20, null, null),
      children: [
        SizedBox(
          width: Get.width * .78,
          height: Get.height * .3,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Obx(
                () => CommonTextField(
                    hintText: task.title!,
                    controller: editController.titleController!,
                    errorText: editController.emptyTitle.value
                        ? 'Required Field'
                        : (editController.titleErrorState.value
                            ? editController.titleErrorText.value
                            : null),
                    onChanged: (value) {
                      editController.updateErrorText(value);
                    }),
              ),
              Obx(
                () => CommonTextField(
                  hintText: task.description!,
                  controller: editController.descriptionController!,
                  errorText: editController.emptyDescription.value
                      ? 'Required Field'
                      : null,
                ),
              ),
              Row(
                children: [
                  Expanded(
                    child: MyMaterialBotton(
                        onPress: () => Get.back(),
                        text: 'Cancel',
                        textColor: primaryColor),
                  ),
                  Expanded(
                    child: MyMaterialBotton(
                      onPress: () => editController.onEditTitlePressed(),
                      text: 'Edit',
                      textColor: Colors.white,
                      bottonColor: primaryColor,
                    ),
                  )
                ],
              ),
            ],
          ),
        )
      ],
    );
  }
}
