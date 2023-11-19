import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:training_task1/core/values/values.dart';
import 'package:training_task1/features/tasks/controllers/add_new_task_controller.dart';
import 'package:training_task1/widgets/common_text_field.dart';
import 'package:training_task1/widgets/icon_widget.dart';

class AddNewTaskScreen extends StatelessWidget {
  const AddNewTaskScreen({super.key});
  @override
  Widget build(BuildContext context) {
    AddNewTaskController addTaskController = Get.put(AddNewTaskController());

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
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(
                    'Add Task',
                    style: textTheme(20, null, null),
                  ),
                  const SizedBox(height: 12),
                  Obx(() => CommonTextField(
                        hintText: "Task Title",
                        controller: addTaskController.titleController!,
                        errorText: addTaskController.errorState.value
                            ? 'Text length should be less than 25 characters.'
                            : null,
                      )),
                  const SizedBox(height: 12),
                  CommonTextField(
                    hintText: 'Task Description',
                    controller: addTaskController.descriptionController!,
                    maxLines: 3,
                  ),
                  const SizedBox(height: 12),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Flexible(
                          flex: 1,
                          child: Row(
                            children: [
                              IconButton(
                                onPressed: () {
                                  addTaskController
                                      .selectDateTime(Get.context!);
                                },
                                icon: const Icon(Icons.calendar_month_outlined),
                                iconSize: 25,
                              ),
                              IconWidget(
                                path: 'assets/icons/tag.svg',
                                press: () =>
                                    addTaskController.onCategoryIconPressed(),
                                size: 30,
                              )
                            ],
                          )),
                      IconButton(
                        onPressed: () {
                          addTaskController.validateTaskData();
                          // Get.back(); // this deletes the controller
                        },
                        icon: const Icon(Icons.send),
                        iconSize: 25,
                      )
                    ],
                  ),
                ],
              ),
            ),
          );
        },
      );
    });
  }
}
