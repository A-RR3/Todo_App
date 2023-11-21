import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:training_task1/data/data.dart';
import 'package:training_task1/data/datasource/data_base.dart';
import 'package:training_task1/domain/interactors/impl/task_interactor_impl.dart';
import 'package:training_task1/utils/helpers.dart';
import 'package:training_task1/domain/interactors/impl/category_interactor_impl.dart';
import 'package:training_task1/features/tasks/screens/add_new_task_screen.dart';

class HomeController extends GetxController {
  //variables
  var taskList = <Task>[].obs;
  var doneTodos = <Task>[].obs;
  var selectedValue = 'All'.obs;
  RxString dayFormat = 'Today'.obs;
  RxBool isLoading = true.obs;
  var categoriesList = <Category>[].obs;
  //getters
  RxInt get tasksCount => taskList.length.obs;

  //database
  TasksInteractorImpl service = TasksInteractorImpl();
  CategoriesInteractorImpl cat = CategoriesInteractorImpl();

  @override
  void onInit() async {
    //insert some categories in the DB when it is first initialized
    // await createCategories();
    await getCategories();
    await getTasks();
    getDoneTasks();
    super.onInit();
  }

  String formatDay(Task task) {
    DateTime dueDate = Helpers.stringToDateTime(task.date!);
    bool isEqualToday = dueDate.toString().split(' ')[0] ==
        DateTime.now().toString().split(' ')[0];

    if (!isEqualToday) {
      return dayFormat.value = Helpers.formatDayFromDateTime(dueDate);
    }
    return dayFormat.value = 'Today';
  }

  Future<void> getTasks() async {
    taskList.value = await service.readAll();
    isLoading.value = false;
  }

  void getDoneTasks() {
    doneTodos.value = taskList.where((item) => item.isCompleted).toList();
  }

  Future<Category> getCategory(int categoryId) async {
    final CategoriesInteractorImpl service = CategoriesInteractorImpl();
    return await service.findCategory(categoryId);
  }

  Category getTaskCategory(int categoryId) {
    return categoriesList.singleWhere((element) => element.id == categoryId);
  }

  Future<void> getCategories() async {
    CategoriesInteractorImpl service = CategoriesInteractorImpl();
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
    Get.bottomSheet(const AddNewTaskScreen());
  }

  Future<void> createCategories() async {
    // StorageService dbHelper = StorageService();
    CategoriesInteractorImpl service = CategoriesInteractorImpl();
    List<Category> categories = [
      Category.create(
          name: 'education',
          icon: Icons.school,
          color: const Color.fromARGB(255, 99, 200, 250)),
      Category.create(
          name: 'food', icon: Icons.food_bank, color: Colors.orange),
      Category.create(name: 'home', icon: Icons.home, color: Colors.green),
      Category.create(
          name: 'personal', icon: Icons.person, color: Colors.lightBlue),
    ];

    // ignore: avoid_function_literals_in_foreach_calls
    categories.forEach((category) async {
      await service.createCategory(category);
    });
  }
}
