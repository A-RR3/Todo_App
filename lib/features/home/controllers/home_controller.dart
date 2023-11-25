import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:training_task1/data/data.dart';
import 'package:training_task1/domain/implementation/interface/task_interactor.dart';
import 'package:training_task1/domain/implementation/task_interactor_impl.dart';
import 'package:training_task1/utils/helpers.dart';
import 'package:training_task1/domain/implementation/category_interactor_impl.dart';
import 'package:training_task1/features/tasks/screens/add_new_task_screen.dart';

class HomeController extends GetxController {
  //variables
  RxList<Task> taskList = <Task>[].obs;
  var doneTodos = <Task>[].obs;
  var selectedValue = 'All'.obs;
  // RxString dayFormat = 'Today'.obs;
  RxBool isLoading = true.obs;
  var categoriesList = <Category>[].obs;
  //getters
  RxInt get tasksCount => taskList.length.obs;

  //database
  TasksInterface service = TasksInteractor();

  @override
  void onInit() async {
    //insert some categories in the DB when it is first initialized
    await getTasks();
    getDoneTasks();
    super.onInit();
  }

  String formatDay(Task task) {
    DateTime dueDate = Helpers.stringToDateTime(task.date!);
    bool isEqualToday = dueDate.toString().split(' ')[0] ==
        DateTime.now().toString().split(' ')[0];

    if (isEqualToday) {
      return 'Today';
    }
    return Helpers.formatDayFromDateTime(dueDate);
    // return dayFormat.value = 'Today';
  }

  Future<void> getTasks() async {
    taskList.value = await service.readAll();
    isLoading.value = false;
  }

  void getDoneTasks() {
    doneTodos.value = taskList.where((item) => item.isCompleted).toList();
  }

  Category getTaskCategory(int categoryId) {
    return categoriesList.singleWhere((element) => element.id == categoryId);
  }

  Future<void> getCategories() async {
    CategoriesInteractor service = CategoriesInteractor();
    categoriesList.value = await service.getCategories();
  }

  void markAsCompleted(Task task) async {
    if (task.isCompleted == false) {
      task.isCompleted = true;
      await service.updateTask(task);
      await getTasks();

      getDoneTasks();
    } else {
      Get.showSnackbar(GetSnackBar(
        messageText: const Text('task is already done'),
        backgroundColor: const Color(0xFF303030).withOpacity(.3),
      ));
    }
  }

  void toggleTaskCompletion(Task task) async {
    bool completed = !(task.isCompleted);
    task.isCompleted = completed;
    await service.updateTask(task);
    await getTasks();
    getDoneTasks();
  }

  Future<void> deleteTask(Task task) async {
    try {
      await service.deleteTask(task);
      taskList.remove(task);
      if (task.isCompleted == true) {
        doneTodos.remove(task);
      }
      taskList.refresh();
      doneTodos.refresh();
    } catch (e) {
      debugPrint(e.toString());
    }
  }

  void onAddNewTaskPressed() {
    Get.bottomSheet(AddNewTaskScreen());
  }
}
