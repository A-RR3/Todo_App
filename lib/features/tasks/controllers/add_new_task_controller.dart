import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:training_task1/core/values/values.dart';
import 'package:training_task1/data/data.dart';
import 'package:training_task1/domain/interactors/impl/task_interactor_impl.dart';
import 'package:training_task1/features/categories/screens/choose_category_screen.dart';
import 'package:training_task1/features/home/controllers/home_controller.dart';
import 'package:training_task1/utils/helpers.dart';

class AddNewTaskController extends GetxController {
  //variables
  TextEditingController? titleController;
  TextEditingController? descriptionController;
  DateTime? selectedDate = DateTime.now();
  int categoryId = 0;
  RxBool errorState = false.obs;

  // StorageService dbHelper = Get.find<StorageService>();
  // StorageService dbHelper = StorageService();
  TasksInteractorImpl service = TasksInteractorImpl();
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

  void onCategoryTypePressed(int index) {
    categoryId = index;
  }

  void _addNewTask() async {
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

    String data =
        '''task:\ntitile:${titleController!.text}\ndes:${descriptionController!.text}\n
    selectedDate$dateFormat\nselectedTime=$timeFormat\ncategoryid=$categoryId ''';
    print(data);
  }

  void validateTaskData() {
    if (titleController!.text.isNotEmpty &&
        descriptionController!.text.isNotEmpty) {
      if (titleController!.text.length > 25) {
        errorState.value = true;
      } else {
        _addNewTask();
        errorState.value = false;
        Get.back();
      }
    } else if (titleController!.text.isEmpty ||
        descriptionController!.text.isEmpty) {
      Get.snackbar('Required', '',
          messageText:
              Text('All fileds are required', style: textTheme(18, null, null)),
          snackPosition: SnackPosition.TOP,
          colorText: pinkClr,
          backgroundColor: greyShadow,
          icon: const Icon(
            Icons.warning_amber_rounded,
            color: Colors.red,
          ),
          duration: const Duration(seconds: 2));
    }
    update();
  }

  void selectDateTime(BuildContext context) async {
    DateTime? pickedDate = await Helpers.selectDate(context);
    TimeOfDay? pickedTime = TimeOfDay.now(); //DateTime.now()
    if (pickedDate != null) {
      pickedTime = await Helpers.selectTime(pickedDate);
      if (pickedTime != null) {
        selectedDate = DateTime(pickedDate.year, pickedDate.month,
            pickedDate.day, pickedTime.hour, pickedTime.minute);
        print('selected date and time ------$selectedDate');
      }
    }
  }

  void onCategoryIconPressed() {
    Get.dialog(ChooseCategoryScreen());
  }
}
