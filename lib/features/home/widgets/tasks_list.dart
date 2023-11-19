import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:training_task1/core/values/constants.dart';
import 'package:training_task1/domain/entities/task.dart';
import 'package:training_task1/features/home/controllers/home_controller.dart';
import 'package:training_task1/features/home/widgets/task_item.dart';
import 'package:training_task1/features/tasks/screens/task_details_screen.dart';

class TasksList extends StatelessWidget {
  TasksList({super.key});
  final controller = Get.find<HomeController>();
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        itemCount: controller.taskList.length,
        itemBuilder: (context, index) {
          Task task = controller.taskList[index];
          return Dismissible(
              key: Key(index.toString()),
              onDismissed: (direction) => controller.deleteTask(task),
              child: TaskItem(
                  marginTop: kDefaultPadding,
                  task: task,
                  onChackBoxChange: () => controller.toggleTaskCompletion(task),
                  onPressed: () => Get.to(() => TaskDetailsScreen(
                        task: task,
                      ))));
        });
  }
}
