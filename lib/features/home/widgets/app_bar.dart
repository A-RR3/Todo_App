import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:training_task1/features/calendar/screens/calendar_screen.dart';
import 'package:training_task1/features/home/controllers/home_controller.dart';

class MyAppBar extends StatelessWidget implements PreferredSizeWidget {
  const MyAppBar({super.key, this.value});
  final int? value;

  @override
  Widget build(BuildContext context) {
    final taskController = Get.find<HomeController>();

    return AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        // title: Text("Home"),
        actions: [
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(15.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                // textBaseline: TextBaseline.alphabetic,
                children: [
                  Obx(
                    () => Text(
                      "Tasks ${taskController.tasksCount}",
                      style: const TextStyle(fontSize: 18),
                    ),
                  ),
                  const Text(
                    "Home",
                    style: TextStyle(fontSize: 20),
                  ),
                  Center(
                    child: IconButton(
                      onPressed: () {
                        Get.to(() => MyCalendarScreen());
                      },
                      icon: const Icon(
                        Icons.calendar_month_outlined,
                        size: 25,
                      ),
                    ),
                  )
                ],
              ),
            ),
          )
        ]);
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
