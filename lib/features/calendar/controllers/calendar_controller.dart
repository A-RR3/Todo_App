// ignore_for_file: invalid_use_of_protected_member

import 'package:get/get.dart';
import 'package:training_task1/domain/entities/task.dart';
import 'package:training_task1/features/home/controllers/home_controller.dart';
import 'package:training_task1/utils/helpers.dart';

class CalendarController extends GetxController {
  var selectedDay = DateTime.now().obs;
  RxList<Task> tasksOnTargetDate = <Task>[].obs;
  List<Task> allTasks = <Task>[];
  final homeController = Get.find<HomeController>();

  @override
  void onInit() {
    allTasks = homeController.taskList.value;
    print('all tasks: ${allTasks.toList()}');
    super.onInit();
  }

  void onDayPressed(DateTime date) {
    if (isDateHasTasks(date).value) {
      tasksOnTargetDate.assignAll(gettasksOnTargetDate(date));
      print('pressed day tasks $tasksOnTargetDate');
      selectedDay.value = date;
    } else {
      tasksOnTargetDate.value = [];
    }
  }

  RxBool isDateHasTasks(DateTime date) {
    bool value =
        allTasks.any((task) => Helpers.isTaskFromSelectedDate(task, date));
    if (value) {
      return true.obs;
    }
    return false.obs;
  }

  List<Task> gettasksOnTargetDate(DateTime date) {
    String stringDate = Helpers.formatDateFromDateTime(date);
    return allTasks.where((task) => task.date == stringDate).toList();
  }
}
