// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:training_task1/features/home/screens/empty_home_screen.dart';
import 'package:training_task1/features/home/screens/loading_state.dart';
import 'package:training_task1/features/home/widgets/app_bar.dart';
import 'package:training_task1/features/home/widgets/done_list.dart';
import 'package:training_task1/features/home/widgets/drop_down_menu.dart';
import 'package:training_task1/features/home/widgets/tasks_list.dart';
import '../../../core/values/colors.dart';
import '../controllers/home_controller.dart';

// ignore: must_be_immutable
class MyHomePage extends StatelessWidget {
  MyHomePage({super.key});
//because date we need a statful wifget
  HomeController controller = Get.put(HomeController());

  @override
  Widget build(BuildContext context) {
    // var size = MediaQuery.of(context).size;
    return Scaffold(
        backgroundColor: bgColor,
        appBar: MyAppBar(),
        body: _showTaskts(),
        floatingActionButton: FloatingActionButton(
          backgroundColor: Color(0xFF8687E7),
          onPressed: () => controller.onAddNewTaskPressed(),
          tooltip: 'Add Task',
          child: const Icon(Icons.add),
        ));
  }

  Widget _showTaskts() {
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.only(left: 20, right: 20, top: 10),
        child: Column(children: [
          SizedBox(
            width: double.infinity,
            child:
                Align(alignment: Alignment.centerLeft, child: DropDownMenu()),
          ),
          Expanded(
              child: Obx(() => controller.isLoading.value
                  ? LoadingStateScreen()
                  : (controller.taskList.isEmpty
                      ? EmptyHomeScreen()
                      : (controller.selectedValue.value == 'All'
                          ? TasksList()
                          : DoneTasksList()))))
        ]),
      ),
    );
  }
}
