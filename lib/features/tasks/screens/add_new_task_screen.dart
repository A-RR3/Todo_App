import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:training_task1/core/values/values.dart';
import 'package:training_task1/features/tasks/controllers/add_new_task_controller.dart';
import 'package:training_task1/features/tasks/controllers/task_form_controller.dart';
import 'package:training_task1/widgets/common_text_field.dart';
import 'package:training_task1/widgets/icon_widget.dart';

class AddNewTaskScreen extends StatelessWidget with TaskFormController {
  AddNewTaskScreen({super.key});
  AddNewTaskController addTaskController = Get.put(AddNewTaskController());
  @override
  Widget build(BuildContext context) {
    return GetBuilder<AddNewTaskController>(builder: (_) {
      return BottomSheet(
        elevation: 10,
        shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.only(
                topLeft: Radius.circular(20), topRight: Radius.circular(20))),
        backgroundColor: greyShadow,
        onClosing: () {},
        builder: (context) {
          return Padding(
            padding: const EdgeInsets.all(20.0),
            child: SingleChildScrollView(
              child: Form(
                key: formKey,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text(
                      'Add Task',
                      style: textTheme(20, null, null),
                    ),
                    const SizedBox(height: 12),
                    CommonTextField(
                        hintText: "Task Title",
                        controller: addTaskController.titleController!,
                        validator: (value) => validateTitleInput(value)),
                    const SizedBox(height: 12),
                    CommonTextField(
                      hintText: 'Task Description',
                      controller: addTaskController.descriptionController!,
                      validator: (value) => validateDescription(value),
                    ),
                    const SizedBox(height: 12),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Flexible(
                            flex: 1,
                            child: Row(
                              children: [
                                IconWidget(
                                  path: 'assets/icons/timer.svg',
                                  press: () => addTaskController
                                      .selectDateTime(Get.context!),
                                  size: 25,
                                ),
                                IconWidget(
                                  path: 'assets/icons/tag.svg',
                                  press: () =>
                                      addTaskController.onCategoryIconPressed(),
                                  size: 30,
                                )
                              ],
                            )),
                        IconWidget(
                          path: 'assets/icons/send.svg',
                          press: () {
                            onSubmitForm;
                            addTaskController.addNewTask();
                            Get.back();
                          },
                          size: 25,
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          );
        },
      );
    });
  }
}
