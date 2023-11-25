import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:training_task1/data/data.dart';
import 'package:training_task1/domain/implementation/task_interactor_impl.dart';
import 'package:training_task1/features/categories/controllers/task_controller.dart';
import 'package:training_task1/features/categories/screens/choose_category_screen.dart';
import 'package:training_task1/features/home/controllers/home_controller.dart';
import 'package:training_task1/utils/helpers.dart';

class AddNewTaskController extends GetxController implements TaskController {
  //variables
  TextEditingController? titleController;
  TextEditingController? descriptionController;
  DateTime? selectedDate = DateTime.now();
  int categoryId = 0;
  TasksInteractor service = TasksInteractor();
  // RxBool errorState = false.obs;

  HomeController homeController = Get.find<HomeController>();

  @override
  void onInit() async {
    titleController = TextEditingController();
    descriptionController = TextEditingController();
    super.onInit();
  }

  @override
  void onClose() {
    titleController!.dispose();
    descriptionController!.dispose();
    super.onClose();
  }

  Future<Task> getTaskById(int id) async {
    return await service.getSingleTask(id);
  }

  @override
  void onCategoryTypePressed(int index) {
    categoryId = index;
  }

  void addNewTask() async {
    String timeFormat = DateFormat("hh:mm a").format(selectedDate!).toString();
    String dateFormat = DateFormat.yMd('en_US').format(selectedDate!);
    Task task = Task.create(
        title: titleController!.text,
        date: dateFormat,
        time: timeFormat,
        categoryId: categoryId,
        description: descriptionController!.text);
    await service.addTask(task);
    homeController.taskList.add(task);
    homeController.taskList.refresh();
  }

  void selectDateTime(BuildContext context) async {
    DateTime? pickedDate = await Helpers.selectDate(context);
    TimeOfDay? pickedTime = TimeOfDay.now(); //DateTime.now()
    if (pickedDate != null) {
      pickedTime = await Helpers.selectTime(pickedDate);
      if (pickedTime != null) {
        selectedDate = DateTime(pickedDate.year, pickedDate.month,
            pickedDate.day, pickedTime.hour, pickedTime.minute);
      }
    }
  }

  void onCategoryIconPressed() {
    Get.dialog(ChooseCategoryScreen(
      controller: Get.find<AddNewTaskController>(),
    ));
  }
}
