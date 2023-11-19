import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:training_task1/core/values/colors.dart';
import 'package:training_task1/features/home/controllers/home_controller.dart';

class DropDownMenu extends StatelessWidget {
  DropDownMenu({super.key});
  final homeController = Get.find<HomeController>();

  @override
  Widget build(BuildContext context) {
    return Container(
        height: 50,
        decoration: BoxDecoration(
            color: greyShadow.withOpacity(.6),
            borderRadius: BorderRadius.circular(6)),
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
        child: Obx(
          () => DropdownButton<String>(
            value: homeController.selectedValue.value,
            onChanged: (String? newValue) {
              homeController.selectedValue.value = newValue!;
            },
            items: <String>['All', 'Completed']
                .map<DropdownMenuItem<String>>((String value) {
              return DropdownMenuItem<String>(
                value: value,
                child: Text(value),
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
