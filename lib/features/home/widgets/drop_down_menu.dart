import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:training_task1/core/values/colors.dart';
import 'package:training_task1/features/home/controllers/home_controller.dart';
import 'package:training_task1/utils/task_status.dart';
import 'package:training_task1/utils/utils.dart';

class DropDownMenu extends StatelessWidget {
  DropDownMenu({super.key});
  final homeController = Get.find<HomeController>();

  @override
  Widget build(BuildContext context) {
    return Container(
        height: 30,
        decoration: BoxDecoration(
            color: greyShadow.withOpacity(.6),
            borderRadius: BorderRadius.circular(6)),
        padding: const EdgeInsets.symmetric(horizontal: 10),
        child: Obx(
          () => DropdownButton<String>(
            value: TaskStatus.all.value,
            onChanged: (String? value) {
              homeController.selectedValue.value = value!;
            },
            items:TaskStatus.values
                .map((TaskStatus status) {
              return DropdownMenuItem<String>(
                value: status.value,
                child: Text(status.value),
              );
            }).toList(),
            icon: const Icon(
              Icons.keyboard_arrow_down,
              size: 32,
              color: Colors.grey,
            ),
            elevation: 3,
            underline: Container(height: 0),
            borderRadius: BorderRadius.circular(15),
          ),
        ));
  }
}
