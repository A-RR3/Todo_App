import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:training_task1/core/values/values.dart';
import 'package:training_task1/domain/entities/task.dart';
import 'package:training_task1/features/home/controllers/home_controller.dart';
import 'package:training_task1/features/home/widgets/task_item.dart';

class DoneTasksList extends StatelessWidget {
  DoneTasksList({super.key});
  final controller = Get.find<HomeController>();

  @override
  Widget build(BuildContext context) {
    List<Task> doneTasks = controller.doneTodos;

    return Obx(() => doneTasks.isEmpty
        ? Center(
            child: Text(
            "Nothing done yet",
            style: textTheme(20, null, null),
          ))
        : ListView.builder(
            itemCount: doneTasks.length,
            itemBuilder: (context, index) {
              Task task = doneTasks[index];
              return TaskItem(
                marginTop: kDefaultPadding,
                task: task,
              );
            }));
  }
}
