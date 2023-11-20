// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:training_task1/core/values/colors.dart';
import 'package:training_task1/domain/entities/task.dart';
import 'package:training_task1/features/calendar/screens/calendar_screen.dart';
import 'package:training_task1/features/categories/widgets/material_botton.dart';
import 'package:training_task1/features/home/controllers/home_controller.dart';
import 'package:training_task1/features/tasks/controllers/edit_task_controller.dart';
import 'package:training_task1/features/tasks/widgets/edit_category_widget.dart';
import 'package:training_task1/features/tasks/widgets/edit_time_widget.dart';
import 'package:training_task1/features/tasks/widgets/labeled_icon_widget.dart';
import 'package:training_task1/features/tasks/widgets/mark_as_complete_widget.dart';
import 'package:training_task1/features/tasks/widgets/share_task_widget.dart';
import 'package:training_task1/features/tasks/widgets/title_description_widget.dart';
import 'package:training_task1/utils/helpers.dart';

class TaskDetailsScreen extends StatelessWidget {
  TaskDetailsScreen({super.key, required this.task});
  final Task task;
  final homeController = Get.find<HomeController>();
  EditTaskController editController = Get.put(EditTaskController());
  @override
  Widget build(BuildContext context) {
    editController.titleController!.text = task.title!;
    editController.descriptionController!.text = task.description!;
    editController.categoryId = task.categoryId;
    editController.selectedDate = Helpers.stringToDateTime(task.date!);
    editController.category = homeController.categoriesList
        .firstWhere((element) => element.id == task.categoryId);

    return Scaffold(
      backgroundColor: bgColor,
      body: SafeArea(
          child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
              child: SingleChildScrollView(
                scrollDirection: Axis.vertical,
                child: Column(
                  children: [
                    MarkAsComplete(
                      onPressed: () => homeController.markAsCompleted(task),
                    ),
                    EditTitleSection(
                        task: task,
                        onPress: () => editController.onEditIconPressed(task)),
                    EditTimeWidget(
                        pathSvg: 'assets/icons/timer.svg',
                        task: task,
                        onPressed: () =>
                            editController.selectDateTime(context)),
                    EditCategoryWidget(
                      pathSvg: 'assets/icons/tag.svg',
                      text: 'Task Category',
                      task: task,
                      onPressed: () => editController.onChangeCategory(),
                    ),
                    Divider(
                      height: Get.height * .1,
                      color: Colors.white,
                    ),
                    ShareTaskWidget(
                      pathSvg: 'assets/icons/share.svg',
                      text: 'Share Task',
                      press: () => editController.sharePressed(task),
                      // press: () {},
                    ),
                    LabeledIconWidget(
                        pathSvg: 'assets/icons/calendar.svg',
                        text: 'Calendar',
                        press: () {
                          Get.to(() => MyCalendarScreen());
                        }),
                    LabeledIconWidget(
                        pathSvg: 'assets/icons/trash.svg',
                        text: 'Delete Task',
                        color: Colors.red,
                        press: () {
                          homeController.deleteTask(task);
                          Get.back();
                        }),
                    SizedBox(
                      height: Get.height * .08,
                    ),
                    Row(
                      children: [
                        Expanded(
                            child: MyMaterialBotton(
                          onPress: () {
                            editController.onEditBottonPressed(task);
                            Get.back();
                          },
                          text: 'Edit',
                          textColor: Colors.white,
                          bottonColor: primaryColor,
                        ))
                      ],
                    )
                  ],
                ),
              ))),
    );
  }
}
